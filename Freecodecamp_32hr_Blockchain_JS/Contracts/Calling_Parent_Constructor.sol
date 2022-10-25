// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//Calling Parent Constructor : 2 ways
//https://docs.soliditylang.org/en/v0.8.16/contracts.html#constructors


contract A{
    uint x;
    constructor(uint _x){
        x = _x;
    }
}

//First way is to provide arguments for base constructor while inheriting 
contract B is A(2){
    
}

//Other way is to provide arguments inside child contract
contract C is A{
    constructor(uint _x) A(_x){

    }
}

//You can also use both ways in case of multiple inheritance
//Suppose there is another base contract B as well
/*contract C is A(2), B{
    constructor(uint _x) B(_x){
    }
} */

//If a contract doesn't provide values for base contract constructor then it has to be marked as abstract
//abstract contract C is A{ }
//The next contract which derives from C will have to do the job for the base contrct A
/*contract D is C{
    constructor (uint _x) A(_x){
    }
}*/
    

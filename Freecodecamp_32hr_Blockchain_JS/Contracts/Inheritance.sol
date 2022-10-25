// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//Inheritance is use data of one contract in another
//One way is to copy the code from contract A to B and then customize it as per our wish and use it
//Other way it to write import "./ContractA.sol";
//Contract A will be parent and B will be the child contract inheriting from A
//Functions of the parent contract that will be modified/overridden when inherited in the child contract needs to be declared as virtual in the parent contract and override in the child contract

contract A{
    function setA() virtual public pure returns(string memory ){
        return "A";
    }

    function set_A() virtual public pure returns(string memory ){
        return "A";
    }

    function setA2() public pure returns(string memory ){
        return "A";
    }
}

//Child contract B
pragma solidity 0.8.7;

import "./Inheritance.sol";

contract B is A{

    function setA() public pure override returns(string memory ) {
        return "Overridden";
    }
    //This inherits all the functions of contract A from Inheritance.sol
    //We r just modifying function setA() here
    //since function setA2() from contract A is not virtual , we cannot modify it but we can still use it in this contract
    

}

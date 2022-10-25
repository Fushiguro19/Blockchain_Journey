// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//Inheritance is use data of one contract in another
//One way is to copy the code from contract A to B and then customize it as per our wish and use it
//Other way it to write import "./ContractA.sol" when contract A file is separately stored; Using import deploys both contracts on the same address

//....................................................... IMPORTANT ...............................................................
/*Inheritance vs Import : Import allows to use another object/file only by creating its instance first. Also we can use the functions/variables/methods etc
of the imported file as it is without modifying. You cannot use the func/methods of the inherited file on the inheritor file's data. They can only be used on
the inherited file's data. We r basically calling those functions as it is and not using them in our own file.
Inheritance copies everything from the parent class into child class with the freedom of modifying them 
and there is no need of creating its instance first. We use those functions on our own data. */
// ............................................................XXXX.....................................................................

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

//import "./Inheritance.sol"; .....when u want all variables, func etc data to be accessible in contract B as well

contract B is A{

    function setA() public pure virtual override returns(string memory ) {
        return "Overridden";
    }
    //This inherits all the functions of contract A from Inheritance.sol
    //We r just modifying function setA() here
    //since function setA2() from contract A is not virtual , we cannot modify it but we can still use it in this contract
    

}

// MULTIPLE INHERITANCE .................
//Inheriting from multiple contracts
//Go in the order from the parent class to the derived class
//Lets say A is parent, B derives from A and C derives from both A & B
//then order of inheritance will be A -> B -> C
//https://www.youtube.com/watch?v=ITxPOG9Djwc&list=PLO5VPQH6OWdVQwpQfw9rZ67O6Pjfo6q-p&index=32&ab_channel=SmartContractProgrammer

//https://docs.soliditylang.org/en/v0.8.16/contracts.html#inheritance


 //Multiple Inheritance : SPecify contracts in order
 //For overriding, mentioning the contracts is necessary but the order isn't
contract C is A,B{
    function setA() public pure override(A,B) returns(string memory ) {
        return "C";
    }
}

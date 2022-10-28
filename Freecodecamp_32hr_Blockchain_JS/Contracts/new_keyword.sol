// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//2 ways to create a contract from another contract : Create and Create2
//We will see Create here

//new keyword deploys a contract

contract Account{
    address public deployer;
    address public owner;

    constructor(address _owner) payable {
        owner = _owner;
        deployer = msg.sender; //this will be the address of deployer contract which is AccountFactory here
    } 
}

//Contract that "deploys" another contract is called Factory/factory contract
contract AccountFactory{
    
    Account[] public accounts; //array to store addresses of all the newly contracts of type Account
    //function is payable coz to send some ether we should first have some ether
    function deployerfunc(address _owner) external payable {
        Account account = new Account{value : 111}(_owner);
        //here we assign the deployed Account contract to a Account type variable account
        //Account{value : 111} is to send ether required by constructor while deploying a new contract... its the same as sending value in call method
        accounts.push(account);
    }
    //Making 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 address as the owner form the account section in deploy
    //After deploying, copy the address from 0 index of accounts and pste in Address section after selecting Account contrct from the drop down

}

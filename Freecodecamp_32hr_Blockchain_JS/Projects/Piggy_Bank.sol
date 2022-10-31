// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//anyone can deposit ether
//only owner can withdraw
//contract will selfdestruct when owner withdraws

contract PiggyBank{
    address public owner = msg.sender;
    event Deposit(uint amount);
    event Withdraw(uint amount);
    
    receive() external payable {
        emit Deposit(msg.value);
    }
    
    function getbalance() external view returns(uint){
        return address(this).balance;
    }


    function withdraw() external {
        require(msg.sender == owner, "Not owner");
        emit Withdraw(address(this).balance); //should be before selfdestruct
        selfdestruct(payable (msg.sender)); //selfdestruct does both the jobs of withdrawing all the amount towards the withdrawer acct and deleting the contract
    }
}

// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//Anyone can send ether to this contract
//Only the OWNER can withdraw eth out of this contract
//The address of the contract creator/deployer is separate from the smart contract address
//The address for smart contracts are generated using the nonce of
//the contract creation transaction and the address of the contract creator.

contract Wallet{
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {} //to deposit ether after the contract is deployed
    
    //withdraw function for the owner to withdraw amount 
    //from this contract to their own address
    
    function withdraw(uint _amount) external {
        require(msg.sender == owner, "Caller is not owner");
        //owner.transfer(_amount); instead of owner we can write msg.sender 
        //(as it is required for both to be same) which can save us some gas
        payable(msg.sender).transfer(_amount);
        //we can also use call() here
    }

    function getBalance() external view returns(uint){
        return address(this).balance;
    }
}

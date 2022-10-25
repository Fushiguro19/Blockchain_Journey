// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//https://docs.soliditylang.org/en/v0.8.15/contracts.html#events
//https://github.com/web3/web3.js/blob/1.x/docs/web3-eth-contract.rst#events

contract Events{
    event Log(string message, uint val);
    event indexedLog(address indexed sender, uint val);
    //upto 3 indexed parameters r allowed

    function example() external {
        emit Log("foo", 123); //these 2 parameters will be stored on the blockchain in the "transaction log"
        emit indexedLog(msg.sender, 789);
        //indexed helps filter data on the basis of a particular parameter
    }


    //simplest chat app on blockchain .... pay to send messages
    event Message(address indexed _from, address indexed _to, string message);

    function sendMessage(address _to, string calldata _message) external {
        emit Message(msg.sender, _to, _message);
    }
}

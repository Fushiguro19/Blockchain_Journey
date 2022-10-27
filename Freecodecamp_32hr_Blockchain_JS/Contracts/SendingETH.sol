// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract sendEther{
    //to send ether, we need to deposit some ether first in this contract
    //We can do it by declaring constructor as payable which enables us to deposit some ether shile deploying
    //OR we can declare a receive/fallback function to receive some ether after the contract is deployed
    //mainly we will use receive func coz we want to just receive ether
    //since we do not have a fallback func, any function called apart from sending ether will fail

    constructor() payable {} //this enables to deposit ether as soon as we click on deploy

    receive() external payable {} 
    //To use only receive, without constructor payable, then deploy this contract, add some value to be deposited in the value section, then click on transact
    //in Low Level Transactions.... this will deposit ether in our contract

    function sendviaTransfer(address payable _to) external payable{
        _to.transfer(123); //will forward 2300 gas with 123 wei to execute this transaction
        //if call fails for some reason then whole transaction will fail
    }

    function sendviaSend(address payable _to) external payable{
        bool sent = _to.send(123); //will forward 2300 gas with 123 wei to execute this transaction
        //sends a bool to indicate success or failure of the transaction

        require(sent, "failed");
        //send() not used much... preferred ones are transfer() and call()
    }

    function sendviaCall(address payable _to) external payable{
        (bool sent, ) = _to.call{value : 123}(""); //will forward all available gas with 123 wei to execute this transaction
        require(sent, "failed");
        //call() has 2 args, one is amount to be sent and other is the data requested which can be a function called from another contract
        //it returns 1) bool indicating success/failure 2)the data received after the execution of the function requested by this contract, in form of bytes
        //we have omitted bytes memory data ryt now , we only need bool sent

    }
}

contract EthReceiver{
    event Log(uint gas, uint amount );

    receive() external payable {
        emit Log(msg.value, gasleft());
    }
}

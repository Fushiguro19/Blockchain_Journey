//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Ownable{
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "not owner");
        _;
    }

    function setOwner(address _newowner) external onlyOwner{
        require(_newowner != address(0), "invalid address");
        owner = _newowner;
    } //address(0) is the address which doesn't have any private key known to anyone and tokens passed to it can never be recovered

    function onlyOwnercanCall() external onlyOwner{
        //code
    }

    function anyonecanCall() external {
        //code
    }
}

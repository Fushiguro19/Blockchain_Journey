// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//self-destruct method to delete contract
//it deletes a contract 
//it also force sends its balance ether to the caller contract even if the caller contract
//has no fallback/receive function to receive ether

contract DeleteContract{
    
    constructor() payable {} //to test the case when this contract does have some ether

    function kill() external {
        selfdestruct(payable(msg.sender));
        //when this is called, contract will push ether into msg.sender address thats y we made
        //it payable ... and then it will delete itself
        //if there is no ether in this contract , then no ether will be sent (Obviously)
    }

    //function to test deletion of this contract
    function testdeletion() external pure returns (uint){
        return 123;
    }

    //test both cases : with ether, with no ether
}

//now we will write a contract that will call the kill function of the above contract
//when it calls kill(), the above contract will force its balance ether(if any) into Caller contract
contract CallerContract{
    
    function getbalance() external view returns (uint){
        return address(this).balance;
        //to check the balance in this contract before and after force push ether from above contract
    }

    function callkill(DeleteContract _kill) external {
        _kill.kill();
    }
}

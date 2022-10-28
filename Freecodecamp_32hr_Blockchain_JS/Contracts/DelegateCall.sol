// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//read this article: very good.....
//https://mirror.xyz/frimoldi.eth/5RObAeE1sPNeEzyGU9gU0olBtVJqnj0MYkJCVtVNGV0
//In short : When we use call , the logs show which contract called, which contract received the call etc etc
//When we use delegatecall then its like the function was copied in the contract using delegatecall rather than being called from a diff contract

contract TestDelegateCall{
    uint public num;
    address public sender;
    uint public value;

    function dgcall(uint _x) external payable{
        num = _x;
        sender = msg.sender;
        value = msg.value;
    }
}

contract Caller{
    address public sender;
    uint public num;
    uint public value;
    //bytes public data;

    function Calldgcall(address _addr, uint _num) external payable {
        // (bool success, bytes memory _data) = _addr.delegatecall(abi.encodeWithSignature("dgcall(uint256)", 123));
        // require(success, "failed");
        // data = _data;

        (bool success, bytes memory data) = _addr.delegatecall(abi.encodeWithSelector(TestDelegateCall.dgcall.selector, _num));
        require(success, "failed");
    }

    /* What happens is when we delegatecall dgcall() function then it behaves
    like its the function of Caller contract only... only the Caller contract's
    state variabled are updated and nothing happens in the TestDelegate contract.
    We just use its address to use in Calldgcall func. Hencem if we want to use 
    some func of another contract without making any changes in it, then we can use
    delegatecall(). */ 

}

// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract TestCall {
    uint public x;
    event Log(address caller, uint amount, string message);

    fallback() external payable {
        emit Log(msg.sender, msg.value, "Fallback was called");
    }

    function foo(string memory _message, uint _x) public payable returns (bool, uint) {
        emit Log(msg.sender, msg.value, _message);

        x = _x + 1;
        return(true, 999);
    }
}

contract Caller {
    event Log(bool success, bytes data);

    // Let's imagine that contract Caller does not have the source code for the
    // contract TestCall, but we do know the its address and the function to call.
    function testCallFoo(address payable _addr) public payable {
        // You can send ether and specify a custom gas amount : _addr.call{value: msg.value, gas: 5000}
        //but we will omit the gas part coz it can hinder success of the transactions in case its not enough
        (bool success, bytes memory data) = _addr.call{value: msg.value}(
            abi.encodeWithSignature("foo(string,uint256)", "call foo", 123)
        );
        require(success, "failed");

        emit Log(success, data);
    }

    // Calling a function that does not exist triggers the fallback function.
    function testCallDoesNotExist(address _addr) public {
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("doesNotExist()")
        );
        require(success, "call failed");

        emit Log(success, data);
    }
}

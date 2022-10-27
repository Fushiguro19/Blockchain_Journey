// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract CallTestContract{
    function callSetValue(address _add, uint _x) public returns(uint){
        return(TestContract(_add).setValue(_x));
        //calls TestContract at the address _add which , here, will be the 
        //address when TestContract is deployed. Then we call setValue function 
        //giving it the value _x from this contract
    } 

    function CallgetValue(address _add) public view returns(uint){
        return(TestContract(_add).getValue()); 
    }

    //another way of calling TestContract at address _add is directly declaring it as TestContract _add
    function CallsetValueandSendEther(TestContract _add, uint _x) external payable{
        _add.setXandReceiveValue{value : msg.value}(_x);
    }

    function CallgetValueandSendEther(TestContract _add) external returns(uint, uint){
        (uint x, uint value) = _add.getXandValue();
        return (x, value);
    }
}

contract TestContract{
    uint public x;
    uint public value;

    function setValue(uint _x) public returns(uint){
        x = _x;
        return(x);
    }

    function getValue() external view returns(uint){
        return x;
    }

    function setXandReceiveValue(uint _x) payable external {
        x = _x;
        value = msg.value;
    }

    function getXandValue() payable public returns(uint, uint){
        return(x, value);
    }
}


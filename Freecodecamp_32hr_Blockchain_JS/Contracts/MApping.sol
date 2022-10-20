// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//Mapping : simple and nested
//Set, get, delete
//Mapping is like dictionary in python


contract Mapping{
    mapping(address => uint) public balances;
    mapping(address => mapping(address => bool)) public isFriend; //nested mapping

    function examples() external {
        balances[msg.sender] = 123; //assigning a value to the address msg.sender
        uint bal = balances[msg.sender]; //to view the value of the key msg.sender
        uint bal2 = balances[address(1)];//since there is no value at address(1), this will display 0

        balances[msg.sender] += 456; //updating msg.sender's value to 123+456
        delete balances[msg.sender];  

        isFriend[msg.sender][address(this)] = true; //nested mapping

    }
}


............................................................................XXXXXXX................................................................

//Iterable Mapping
contract IterableMapping{
    mapping(address => uint) public balance;
    mapping(address=>bool) public inserted;
    address[] public keys; //an array of all the keys entered in balance mapping

    /* Logic : When we insert a key:value pair in balances mapping, for the same address we set the bool
    to true in inserted mapping i.e. we keep a track in inserted mapping whether an address is added in
    the balances mapping */
    function set(address _addr, uint _val) external {
        balance[_addr] = _val;
        if(inserted[_addr] != true){
            inserted[_addr] = true;
            keys.push(_addr);
        }
    }

    function getArrSize() external view returns(uint){
        return keys.length;
    }

    function getValues(uint _i) external view returns(uint){
        return balance[keys[_i]];

    }



}

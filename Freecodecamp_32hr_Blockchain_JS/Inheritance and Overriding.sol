//SPDX-License-Identifier: MIT
//Inheritance and Overriding

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";
 
//Inheritance
contract ExtraStorage is SimpleStorage{
    //task is to add 5 to any number we receive as input
    //do it by OVERRIDING
    function store(uint256 _favouriteNumber) public override {
        favouriteNumber = _favouriteNumber + 5;
    /*this function overrides the store func in SimpleStorage contract
    by having the "override" specifier and adding virtual specifier
    in the store func of SimpleStorage contract*/
    
    }
}

// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//keccak256 takes in any data as input in form of bytes and returns a bytes32 output of 32 bytes length
//https://ethereum.stackexchange.com/questions/123176/what-exactly-is-the-output-of-a-keccak256-function

contract hash{
    function hashkeccak(string memory _str, uint _x, address _addr) external pure returns(bytes32){
        return keccak256(abi.encodePacked(_str, _x, _addr));
    }

    //abi.encode vs abi.encodePacked : both convert data into bytes 
    //but encodePacked compresses it , reducing some of the info obtained from abi.encode

    //https://medium.com/@libertylocked/what-are-abi-encoding-functions-in-solidity-0-4-24-c1a90b5ddce8

    function encode(string memory _t1, string memory _t2) external pure returns(bytes memory){
        return abi.encode(_t1, _t2);
    }

    function encodePacked(string memory _t1, string memory _t2) external pure returns(bytes memory){
        return abi.encodePacked(_t1, _t2);
    }
    
    /* HASH COLLISION :
    There can be a situation where inputs are diff but the encoded output comes out same
    for ex : in encodePcked func : 1) input "AAAA", "BBB" nd 2) "AAA", "ABBB"
    both these inputs will return same encoded output. This happens esp when 2 dynamic data types are placed one after the other. 
    When we take keccak256 of this encodePacked , the output is still same for both cases. This is called Hash Collision.
    To resolve this we can either use encode instead of encodePacked or place another datatype between the 2 dynamic data types 
    like, string - uint - string .*/ 
}


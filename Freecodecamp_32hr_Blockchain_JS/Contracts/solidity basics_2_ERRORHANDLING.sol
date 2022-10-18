//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
//3 ways to throw error : require, revert, assert
//Custom Errors are useful as well apart from the above 3 ways

contract learning{
    function requiretest(uint _i) public pure {
        
        //https://medium.com/blockchannel/the-use-of-revert-assert-and-require-in-solidity-and-the-new-revert-opcode-in-the-evm-1a3a7990e06e
        require(_i <= 10, "i is greater than 10");
        //require refunds the remaining gas and returns a value or statement on failing
    }

    function testrevert(uint _i) public pure {
        if(_i > 1){
            //code
            if(_i > 2){
                // code
                if(_i > 10){
                    revert("i>10"); //similar to require but used in complex logic
                }
            }
        }
    }
    uint public num = 123;

    function testassert() public view {
        assert(num == 123); //uses all gas , no return value
        //assert can't go wrong/fail, if it fails then there's a bug in the code
        /* The assert function should only 
        be used to examine invariants and test for internal problems.*/
        //here, if at any moment the value of num changes, then that will imply the code has a bug

    }
    error Myerror(); //declaring custom error, custom errors can take in parameters as well
    function customerror(uint _i) public pure {
        //custom errors r cheaper than require msgs : 
        //the longer the error msg in require, the more gas it will consume
        if ( _i > 10){
            revert Myerror(); //using custom error in the func
        }
        //https://medium.com/coinmonks/solidity-revert-with-custom-error-explained-with-example-d9dff8937ef4
        
    }
}

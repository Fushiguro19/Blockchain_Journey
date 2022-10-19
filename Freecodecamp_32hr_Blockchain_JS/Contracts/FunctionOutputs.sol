// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Test {
    function multipleOutputs() public pure returns(int, bool){
        return(1, true);
    }

    function namedOutputs() external pure returns(int _x, bool _b){
        return(1, true);
    }

    function namedOutputsV2() external pure returns(int _x, bool _b){
        _x = 1;
        _b = true;
    }

    function destructuringassignment() public pure returns(int _x, bool _b) {
        (_x, _b) = multipleOutputs();
        //(, bool _b) = multipleOutputs();
    }
}

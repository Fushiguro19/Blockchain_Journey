// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//state variable not allowed to be declared inside Library



library Compare{
    function compare(uint _x, uint _y) internal pure returns(uint){
        return _x >= _y ? _x : _y;
    }
    //If we declare the func as internal then it gets embedded in the contract using the library
    //which means we don't have to declare the library separately, only deploying the contract using it is enough
    //no use of declaring it external/public, otherwise both have to be deployes separately
    //In cases where library is deployed separately, having ext funcs, we use import
}

contract UseCompare{
    function usecompare(uint x, uint y) external pure returns(uint){
        return Compare.compare(x, y);
    }
}

//Library to find the index of an element in an array
library FindIndex{
    function findI(uint[] storage _arr, uint x) internal view returns(uint){
        for(uint i = 0; i < _arr.length; i++){
            if(_arr[i] == x){
                return i;
            }
        }

        revert("Element Not Found");
    }
}

contract Array{
    using FindIndex for uint[]; //we can directly write arr.findI() now
    //this tells solidity that attach all the functionalities of the libraray 
    //FindIndex (findI in this case) to the datatype uint[] for this contract
    uint[] public arr = [3,2,1];

    function findindex(uint _x) external view returns(uint){
        //return FindIndex.findI(arr, _x);
        return arr.findI(_x);
    }
}

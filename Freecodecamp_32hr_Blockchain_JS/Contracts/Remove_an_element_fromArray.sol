// 1) Using Shifting method


// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Arrayelement{
    //context :
    /* let an array be : [1,2,3,4] .... we want to remove 2
    what we do is , shift elements startng from 2 towards left
    i.e. the array will become [1,3,4,4] and then pop out last 4 */

    uint[] public arr;

    function remove(uint _index) public {
        require(_index < arr.length, "Index out of bounds");
        for(uint i = _index ; i < arr.length-1; i++){
            arr[i] = arr[i+1];
        }
        arr.pop();
    }

    function testremove() public {
        arr = [1,2,3,4,5];
        remove(2);
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);
    }

    
}


// 2) By Replacing Last

// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//context : replacing the element to be removed with the last element and pop out the last element
contract Removal{
    uint[] public arr = [1,2,3,4,5];
    function remove(uint _index) public {
        require(_index < arr.length);
        arr[_index] = arr[arr.length-1];
        arr.pop();
    }

    //we can write the same test() function as in the remove by shifting contract  
}

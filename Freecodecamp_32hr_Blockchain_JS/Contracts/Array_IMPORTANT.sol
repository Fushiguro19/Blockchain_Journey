// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract test{
    uint[] public x;

    function testing() public {
        /*x[0] = 20; this doesn't work for uninitialised dynamic array
        but works for uint[3] public x ........OR ......
        uint[] public x = [1,2,3]*/

        /*for uninitialised dynamic arrays like above we use
        .push() method*/
        
        /* This is because a dynamic array initially has no size allocated in memory
        hence it does not have any index to be allocated a value to... there is no 
        0 index or 1 index , hence we push a value first or initialise it first
        like x = [1,2] and then add more values to it. push method keeps
        increasing the size of array and adds indices to it which we can then 
        update, delete or do operations on....
        While in fixed size array we already define the no of indices array would have
        so it occupies that much space in storage already hence it already has 
        0 index which we can assign value like x[0] = 20; */
    }
}

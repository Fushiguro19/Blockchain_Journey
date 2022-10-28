// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//Interfaces are used to access contract whose code we don't know OR
//the contract is not on the same file OR we don't wanna copy the whole code and
//just wanna use a few functions of it
//Interfaces are just like ABI of a contract ... if u would convert ABI to interface , no data would be lost 
//https://medium.com/upstate-interactive/solidity-how-to-know-when-to-use-abstract-contracts-vs-interfaces-874cab860c56

//We will be using Counter.sol deployed separately
//Pasting its code here just for reference
/* 
pragma solidity 0.8.7;
contract Counter{
    uint public count;

    function increment() external
    {
        count += 1;
    }

    function decrement() external
    {
        count -= 1;
    }
}
*/


//interface starts with interface declaration and an I at the starting of the name of the contract we r creating an interface of
interface ICounter{
    function count() external view returns(uint);
    //count() is the getter function of the variable count as it is declaared public so we can access its getter
    function increment() external;
}

contract AccessCounter{
    uint public count;

    function incrementCounter(ICounter _addr) external{
        _addr.increment(); //calling inc() from interface
        count = _addr.count(); //calling count() getter and assigning it to count
        //ICounter _addr is interface deployed at the address of COunter contract
        //i.e. deploy Counter contract, copy its address and paste it here in the function

    }
}

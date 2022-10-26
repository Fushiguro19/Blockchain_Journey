// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//visibility :
/* public : inside and outside of contract 
external : only outside of contract.... child contract cannot call function directly like contract F calling E.foo() but can use this.foo()
internal : inside of contract and its child contract
private : only inside contract
*/
//https://medium.com/@yangnana11/solidity-function-types-4ad4e5de6d56

contract Visibility{
    uint private x = 0;
    uint public y = 1;
    uint internal z = 2;

    function test() public pure returns(uint){
        return 20;
    }

    function test1() private pure returns(uint){
        return 2;
    }

    function test2() internal pure returns(uint){
        return 200;
    }

    function test3() external pure returns(uint){
        return 2000;
    }

    function callFunctions() external view{
        x+y+z; //can access all 3 variables inside this contract

        test();
        test1();
        test2();//can access all 3 functions
        //cannot call external func from inside the same contract 
        //this.test3(); we can call external func like this but this is an inefficient way, so avoid
        //this keyword basically points to this contract from inside itself
        //i.e. its like we r calling a func externally by pointing to it


        /*Similarly inside the child contract of this contract : 
        1) we can call internal and public variables y and z
        2) We can call public and internal functions
        3) We cannot call private and external functions/variables*/
    }
}

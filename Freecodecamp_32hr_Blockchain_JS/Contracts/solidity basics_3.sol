//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//function modifier : to reuse code before and/or after function
//3 types here : without input, with input and sandwich
contract learningsol{
    bool public paused;
    uint public count;

    function setPause(bool _paused) external{
        paused = _paused;
    }
    
    modifier whenNotPause(){
        require(!paused, "paused");
        _;
    }

    function inc() external whenNotPause{
        /*require(!paused, "paused"); this means if paused is set to false, then !paused will be true 
        which will set the require consition to true and the code will continue. If paused will be true
        that means there's a pause , !paused will be false, hence code will not execute further*/
        count += 1;
    }

    function dec() external whenNotPause{
       // require(!paused, "paused");
        count -= 1;
    }

    modifier cap(uint _y){
        require(_y < 100, "_x >= 100");
        _;
    }
    
    //using 2 modifers, with and without input
    function incby(uint _x) external whenNotPause cap(_x){
        //require(_x < 100, "x >= 100");
        count += _x;
    }

    modifier sandwich(){
        //some code
        count += 10;
        _;
        //more code
        count *= 2;
    }/*what this means is: First foo func will detect sandwich
    and execute its code till it finds _; ... then it will execute its own code and
    once its own code is executed i.e. count += 1, it will execute remaining of the
    modifier's code*/

    //sandwich func between modifier code
    function foo() external sandwich{
        count += 1;
    }
}


//CONSTRUCTOR
contract Contract{
    address public owner;
    uint public x;

    constructor(uint _x){
        owner = msg.sender; //setting the owner to the address which deploys this contract
        x = _x;
    }// here msg.sender will be our address in the account section of the deploy tab
}

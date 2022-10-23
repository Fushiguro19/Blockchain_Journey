// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//https://ethereum.stackexchange.com/questions/117334/bytecode-not-visible-for-deployed-contract

//https://medium.com/@libertylocked/what-are-abi-encoding-functions-in-solidity-0-4-24-c1a90b5ddce8

contract TestContract1{
    address public owner = msg.sender;

    function setOwner(address _owner) public {
        require(msg.sender == owner, "Not Owner");
        owner = _owner;
    }
}

contract TestContract2{

    address public owner = msg.sender;
    uint public value = msg.value; //this will store value which constructor requires from the contract deploying this contract... 
                                   //in this case it is the call method in the execute func in proxy contract
    uint public x;
    uint public y;

    constructor(uint _x, uint _y) payable{
        x = _x;
        y = _y;
    }

}

//This is the contract that will be used to call any contract in the blockchain using contract bytecode and returns the address of the deployed contract
contract Proxy{
    event Deploy(address); //we will emit this event when the contract is successfully deployed
    fallback() external payable {} //in case the deployed contract sends back some ether

    function deploy(bytes memory _code) external payable returns(address addr){
        // _code points to the starting of the memory location of the bytecode
        
        assembly {
            //create(v,p,n)
            // v : amount of ether to be sent
            //p : pointer in memory to the start of the code
            //n : size of the code

            addr := create(callvalue(), add(_code, 0x20), mload(_code))
        }
        require(addr != address(0), "Deploy failed");

        emit Deploy(addr);
    }
    

    //function to send ether : IDK y he is using it here for now
    function execute(address _target, bytes memory _data) external payable {
    (bool success, ) = _target.call{value : msg.value}(_data);
    require(success, "failed");
    } //msg.value is the amount sender has sent to the _target address which is the contract we r deploying
    /*this function is required in case some contract requires ether to be deployed like in TestContract2 , 
    the constructor is set as payable, which means we need to deposit some ether first*/ 
}


//contract to return bytecode of the contract to be deployed and the data as well

contract Helper{
    function getBytecode1() external pure returns(bytes memory){
        bytes memory bytecode = type(TestContract1).creationCode;
        return bytecode;
    }

    function getBytecode2(uint _x, uint _y) external pure returns(bytes memory){
        bytes memory bytecode = type(TestContract2).creationCode;
        return abi.encodePacked(bytecode, abi.encode(_x, _y));
    }//2 inputs are required coz TestContract2 constructor requires 2 inputs 

    function getCalldata(address _owner) external pure returns(bytes memory){
        return abi.encodeWithSignature("setOwner(address)", _owner);
    }//to get data to set owner in TestContract1 function setOwner
}





/* Steps that will happen :

1) TO deploy TEstContract1 : 
..We generate its bytecode from the helper contract via getBytecode1 function
..Input this bytecode in deploy func of Proxy contract and execute
..From the logs option in the terminal , ull find the address of the deployed TestContract1 below events
..Select TestContract1 from the dropdown to deploy -> Paste the above address in "AtAddress" option and click on it.... this will deploy TestContract1 
but at the address we got from the deploy func in Proxy contract
..This TestContract1 will have owner as the proxy Contract

2) To call setOwner func from TestContract1
..We can not call this func directly coz it requires msg.sender to be the owner and the owner is proxy contract here
..First we call getCallData func from helper contract which returns info (the func to be called and the inputs that func requires) in bytes
  abi.encodewithsignature takes in the function to be called as a string which is setOwner(address) here and the other aargument should be the value the func 
  takes in as the input which is "_owner" here. Copy the bytes this func returns
..In the execute func of the proxy contract, paste the address of TestContract1 as _target address and the above bytes as data and execute
..Check the owner in TestContract1 now, it will change to the new owner address we wanted.

3) Calling TestContract2
..get bytecode of the contract from Helper contract getByteCode2 func. it requires 2 inputs since the bytecode should have all the info of the contract which
  also includes the inputs to be sent
..paste this bytecode in the deploy func of the proxy contract and also add some eth "if u want to send it " in the value tab ....execute
..Copy the address from the "args" in the terminal .. select TestContract2 from the dropdown, paste the add in "AtAddress" and execute
..Owner will be proxy contract, value will correspond to the amount of ether proxy contract sent it, x and y will be the values set while generating the bytecode

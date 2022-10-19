//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract learningsolidity{
    uint public myUint; //a state variable whose data remains on the blockchain permanently
    
    /*When we set the state variables as public, we get that blue button after deploying that lets us view the variable's value without writing any extra
    view func for it. This is because as soon as we declare it public, a getter func gets associated with the variable which lets us view it automatically.
    Otherwise, if not declared public, the default state is "internal". */
    
    uint public constant MY_UINT = 123; //constant/immutable have less gas cost than normal variables 

    function HelloWorld() public pure returns(string memory) {
        return("HelloWorld");
    }
    
    //It is not possible to return values from function which are not view/pure i.e. which modify the blockchain. You can use Events in case of state changing
    //functions or create a separate public view getter function .

    function ValueTypes() public pure returns(bool, uint,int,int,int,address){
        bool b = true; /*these all are local variables (not state variables) hence will be removed 
        as soon as we exit the func*/
        uint u = 123;
        int i = -123;
        int min_int = type(int).min; //to know the min value of a datatype
        int max_int = type(int).max;
        address addr = 0xa2f96EF6ed3d67A0352e659B1E980f13e098619F;
        //bytes32 b32 = 
        return(b,u,i,min_int,max_int,addr);
        //if we set the value of state variables here, then that will remain even after the func is over.
    }

    function sub(uint x, uint y) external pure returns(uint){
        return x-y; /*reverting if x is smaller than y due to
        overflow/underflow chk by solidity. Although if the type is changed
        to int from uint, then there is no revert since it takes in negative values*/
    }

    function globalvars() external view returns(address, uint, uint){
        //global vars can be accessed by any contract on the blockchain . some examples r :

        address sender = msg.sender; //the address which calls this function
        uint timestamp = block.timestamp; //the time when the block was mined...it is a Unix timestamp
        uint blocknum = block.number; //number of the cuurent blocks which is one more than the no of blocks mined before it
        return(sender, timestamp, blocknum);
    }

    function viewfunc() external view returns(uint){
        return myUint; //reads data from the blockchain but doesn't modify anything
    }

    function purefunc() external pure returns(uint){
        return 1; //doesn't read or write anything from/on the blockchain
    }

    //if-else
    function ifelse(uint _x) external pure returns(uint){
        if(_x < 10){
            return 1;
        } else if(_x < 20){
            return 2;
        }else{
            return 3;
        }
    }

    //if-else using ternary operator like in JS
    function ternary(uint _x) external pure returns(uint){
        return _x < 10 ? 1 : 2;
    } 

    //for-while loops
    function forloop() external pure{
        for(uint i = 0; i<10; i++){
            //code
            if(i == 3){
                continue ; // on i = 3 , "more code" will not be executed and loop will directly skip to i = 4
            }
            //more code
            if(i == 5){
                break; //this will end the loop altogether and we will be outside the loop
            }

            /*while(condition is true){
                execute the code
            }*/
        }
    }
    
}

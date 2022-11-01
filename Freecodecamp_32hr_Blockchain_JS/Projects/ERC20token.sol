// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;

// ................COmpilation error.....................................
//Contracts inherit interface same way they inherit other contracts. 
//Interface function are implicitly virtual so we do not need to specify virtual 
//Same way we do not need to specify override in the contract using those functions
//But this chng came along from 0.8.8 version and we were using 0.8.7 hence the error to specify the override 
//https://medium.com/coinmonks/solidity-tutorial-all-about-interfaces-f547d2869499
//Also, functions in an interface can only be external
//...............................................xxxxx.......................................


//https://solidity-by-example.org/app/erc20/
//https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0/contracts/token/ERC20/IERC20.sol
// ...................................ETH vs ERC20.....................................
//While Ether (ETH) is the native cryptocurrency of the Ethereum network, 
//the ERC20 token represents a specific standard — or set of rules — that developers 
//can follow to make Ethereum-based tokens. 
//This token standard is only for fungible tokens, and not non-fungible tokens (NFTs).
//............................................xxxxx........................................

//https://docs.openzeppelin.com/contracts/4.x/erc20
//https://docs.openzeppelin.com/contracts/4.x/api/token/erc20

interface IERC20{
    function totalSupply() external view returns (uint); //total amount of tokens available all over
    function balanceOf(address account) external view returns (uint); //amount of tokens the account has
    function transfer(address recipient, uint amount) external returns (bool); //to transfer tokens from the account holder's address to the recipient's address
    function allowance(address owner, address spender) external view returns (uint);// to allow the spender to send tokens ok behalf of the token holder
    function approve(address spender, uint amount) external returns (bool); //to approve the transfer of amount of tokens by the spender to the recipient
    function transferFrom(address sender, address recipient, uint amount) external returns (bool);
    //transfer of amount of tokens from sender to recipient

    event Transfer(address indexed from, address indexed to, uint amount);
    event Approval(address indexed owner, address indexed spender, uint amount);
}

contract ERC20 is IERC20{
    uint public totalSupply; //when we mint tokens this will increase and when we burn tokens this will decrease in number
    mapping (address => uint) public balanceOf; //to map the address to the amount of tokens it has
    mapping (address => mapping (address => uint)) public allowance; //owner address allows spender address to spend uint amount of tokens
    
    //Some metadata about tokens like name, symbol and decimal
    string public name = "MyTOken";
    string public symbol = "MTO";
    uint8 public decimal = 18; //https://docs.openzeppelin.com/contracts/4.x/api/token/erc20#IERC20Metadata
    
    function transfer(address recipient, uint amount) external returns (bool){
        balanceOf[msg.sender] -= amount; //deducting amount from main account
        balanceOf[recipient] += amount;  //adding the same amount to the recipient's account
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    //allowance and balanceOf we r using as state variables so we do not need those functions from IERC20

    function approve(address spender, uint amount) external returns (bool){
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint amount) external returns(bool){
        allowance[sender][msg.sender] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    //msg.sender mints any amount of tokens
    function mint(uint amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount; //since new tokens minted, we inc the balance and totalsupply
        emit Transfer(address(0), msg.sender, amount); //since we r minting new tokens, there is no from address hence address(0)

    }

    //burn tokens
    function burn(uint amount) external {
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }
}

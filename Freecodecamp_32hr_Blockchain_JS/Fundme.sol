//Contract to send ether, get ETH/USD current pricerate in the market, convert ETH to USD, set min USD to be sent....
//SPDX-License-Identifier: MIT

/* 1) Tasks : get(from users)/withdraw funds ; set min funding value 
in USD

2) Solidity Structs and Arrays */

/*Importing the npm package @chainlink/contracts imports AggregatorV3Interface as well */

pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
//this is same copying the code of AggregatorV3Interface.sol here.

contract FundMe{
    
    uint256 public minimumUsd = 50 * 1e18; //1e18 multiplied to ease calculations in terms of wei
    address[] public funders;
    mapping(address => uint256) public addToAmtFunded;

    function fund() public payable {
        
        //require(msg.value > 1e18, "Didn't send enough"); 
        /*1e18 = 1*10^18 = 1000000000000000000 wei = 1eth ..... If msg.value <1 then display the msg */
        
        require(getConversionRate(msg.value) >= minimumUsd, "Didn't send enough"); //setting min limit
        funders.push(msg.sender); //the address which calls this fund function is msg.sender
        addToAmtFunded[msg.sender] = msg.value;
    }

    //func to get value of eth in usd. We will be using Chainlink Data Feeds here.
    /*for this we r gng to interact with an external contract, hence we need its address and ABI.
    For address we go to docs.chain.link -> evm chains -> Data Feeds -> Ethereum data feeds -> Rinkeby
    testnet -> Eth / USD contract.
    Address : 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e */

    function getPrice() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        /*This means a contract at the address 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e will have all the
        functionalities of the interface contract. THis is typecasting of address to a contract type.*/
        (,int256 price,,,)= priceFeed.latestRoundData(); //this function is from the interface contract.
        //the func returns 5 variables but we need only price. refer the code in docs.chain.link section
        //this will return price of ETH in terms of USD.

        return uint256(price * 1e10);

        /*since msg.value is in uint256, we converted price to the same(called typecasting). 
        Also, since 1eth has 18 zeroes in wei and price will have 8 zeroes after decimal , 
        we provide 10 more zeroes to it */
    }

    //func to get eth in terms of USD

    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethprice = getPrice();
        uint256 ethAmountinUSD = (ethprice * ethAmount) / 1e18; //Always multiply before divide
        return ethAmountinUSD;
    }
}

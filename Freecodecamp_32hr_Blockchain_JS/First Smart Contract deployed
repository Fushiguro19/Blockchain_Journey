// SPDX-License-Identifier: MIT
pragma solidity 0.8.8; //^0.8.8 means
//versions above 0.8.8
/*Deployed this contract on Injected Web3 environment which
connects to the metamask wallet*/

contract SimpleStorage {
    //bool hasFavouriteNumber = true;

    //This gets initialized to zero
    /* If we change the visibility to public
    then we can see the value of this variable
    at any given point of time*/
    uint256 public favouriteNumber; 

    /*string favouriteNumberInText = "five";
    int256 favouriteInt = -5;
    address myaddress = 0x192b504f2B12909843269af201a254506702D30b;
    bytes32 favouriteBytes = "cat"; //cat will automatically get converted to bytes
    //bytes32 is the max size it can have*/

    mapping(string => uint256) public nametoFavouriteNumber;

    struct People {
        uint256 favouriteNumber;
        string name;
    }
    
    /*Certain ways to create an object of type People :
    People public person = People({favouriteNumber : 2, name : "Sonakshi"}); 
    OR
    People public person = People(2, "Sonakshi"); */
    
    //Creating an array of type People
    People[] public people;

    
    /*The below function assigns the variable 
    favouriteNumber whatever value is passed to
    _favouriteNumber*/
    function store(uint256 _favouriteNumber) public{
        favouriteNumber = _favouriteNumber;
        //favouriteNumber = favouriteNumber + 1;
        /*Now this contract becomes more expensive
        as it does more than just assigning value*/
    }
    /*Everytime store button is clicked
    a new transaction is formed*/

    /* the value of favouriteNumber is being returned even without the return
    statement mentioned anywhere, is because of the getter func linked with it on
    mkaing it public. */

    function retrieve() public view returns(uint256){
        return favouriteNumber;
    }

    //function to add info in people array
    function addPerson(string memory _name, uint256 _favouriteNumber) public {
       // People memory newPerson = People(_favouriteNumber, _name);
       // people.push(newPerson);
       
        people.push(People(_favouriteNumber, _name));
        nametoFavouriteNumber[_name] = _favouriteNumber;
    } /*data location is only specified for _name coz it is an
    array(string is an array) but not for uint256 coz solidity already
    knows where to store it.*/
}


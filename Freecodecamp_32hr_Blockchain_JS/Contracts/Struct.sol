// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//struct allows to group data together

contract structs{
    struct Car{
        string model;
        uint year;
        address owner;
    }

    Car public car; //using struct as state variable
    Car[] public cars; //struct as array
    mapping(address => Car[]) public carsByOwner; //struct as array in mapping

    //3 ways to initialize struct

    function examples() external {
        //first way
        Car memory Toyota = Car("toyota", 1990, msg.sender); //first way, here the order is imp
        Car memory Fiat = Car({model : "fiat", year : 1991, owner : msg.sender}); //second way like key:value pair, order is not imp
        Car memory Tesla; //third way is default initialisation, string will be empty, year will be 0 and address will be 2 by default
        //now we will give it some values
        Tesla.model = "tesla";
        Tesla.year = 2010;
        Tesla.owner = msg.sender;

        //Since these 3 r in memory , they will vanish as soon as the function is executed
        //Hence, we store them in cars array state variable

        cars.push(Toyota);
        cars.push(Fiat);
        cars.push(Tesla);

        //Another way to directly initialize struct and store in a state variable

        cars.push(Car("TATA", 2020, msg.sender));

        //to update/change values we need to assign cars array to a variable
        Car storage _car = cars[0]; //accessing first element of the array
        _car.model = "KIA" ; //changing model from toyota to kia
        delete _car.owner; //to delete one element
        delete cars[1]; 
        //deletes everything stored at the first index
    }
}

// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

/*Enum is like creating a data type that can hold any value for ex
enum colour which can have multiple value like red, white, blue etc */

//https://solidity-by-example.org/enum/ : visit to see how to import enums from outside the contract

contract ENUM{

    enum Status{
        None,
        Pending,
        Cancelled,
        Rejected,
        Completed,
        Shipped
    }

    Status public status = Status.Cancelled; //initialised enum variable
    //Its value changes when we provide input in setEnum func, the input overwrites the already set value
    Status public status1; //uninitialised enum

    struct Order {
        address buyer;
        Status status2;
    }

    Order[] public orders;

    function setEnum(Status _status, Status _status1) external {
        status = _status;
        status1 = _status1;
    }

    function getEnum() external view returns(Status){
        return status;
    }

    function updateEnum() external {
        status = Status.Shipped;
    }

    function resetEnum() external {
        delete status; //resets the value of status variable to default which is the first element of enum Status
    }

    function setOrder(Status _status123) external {
        Order memory _order = Order(msg.sender, _status123);
        Status _sta = Status.Rejected;
        Order memory _order1 = Order(msg.sender, _sta);
        orders.push(_order);
        orders.push(_order1);

    }
    

}

//Our contract StorageFactory interacts with our previous contract SimpleStorage.

//SPDX-License-Identifier: MIT
//How to interact with other contract based on its address and ABI
pragma solidity ^0.8.0;

/* one way to make sure that StorageFactory contract knows the content
of SimpleStorage contract is to copy-paste the contents of
SimpleStorage here and then creating a new contract of type
SimpleStorage in the StorageFactory contract*/

//A better way is to import the contract using its filepath

import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simplestoragearray; 
    /*an array of type SimpleStorage contract which will store the
    address of all the SimpleStorage contracts created via below func*/
    
    function createSimpleStorageContract() public {
        SimpleStorage simplestorage = new SimpleStorage();
        simplestoragearray.push(simplestorage);
        /*this lets solidity know that a new contract of type 
        SimpleStorage is created. Compile n deploy. simpleStorage
        variable will return the address of the contract deployed
        from the above statement.*/

    }
    
    /*To interact with each of the contracts created from the above func we create sfstore func which
    stores the index and address of each of the contracts in a separate variable*/

    function sfstore(uint256 _simplestorageindex, uint256 _simplestoragenumber) public {
        /*To interact with any contract we need its address and ABI - Application Binary Interface.
        You can find it in COmpilation details option in Compile tab. ABI tells how to interact
        with the contract. As soon as we imported SimpleStorage contract, the ABI was imported along
        with it.*/

       // SimpleStorage simplestorage = simplestoragearray[_simplestorageindex];

        /*since the simplestoragearray is already declared as a SimpleStorage type, we do not need to 
        mention the SimpleStorage object here as : SimpleStorage(simplestoragearray[_simplestorageindex]);
        SimpleStorage() can simply be understood as converting the address simplestoragearray[_simplestorageindex] 
        to a SimpleStorage contract although in reality its a constructor call.*/
        
        //simplestorage.store(_simplestoragenumber); OR

        simplestoragearray[_simplestorageindex].store(); //coz simplestoragearray is already a SImpleStorage object

    }

    function sfget(uint256 _simplestorageindex) public view returns(uint256) {
        SimpleStorage simplestorage = simplestoragearray[_simplestorageindex];
        return simplestorage.retrieve();
    }
}

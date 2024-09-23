
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
 import {SimpleStorage, SimpleStorage2} from "./SimpleStorage.sol";

contract StorageFactory{

    SimpleStorage[] public ListOfSimpleStorageContracts;

    function createSimpleStorageContract() public {
            SimpleStorage newSimpleStorageContract = new SimpleStorage();
            ListOfSimpleStorageContracts.push(newSimpleStorageContract);

    }
    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber )public{
        //ABI
        //Address
        SimpleStorage mySimpleStorage = ListOfSimpleStorageContracts[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber);

    }
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256 ){
                SimpleStorage mySimpleStorage = ListOfSimpleStorageContracts[_simpleStorageIndex];
                return mySimpleStorage.retrieve();

    }
 
}
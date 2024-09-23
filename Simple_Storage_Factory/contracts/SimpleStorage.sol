// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
 contract SimpleStorage{

    uint256 myfavoriteNumber;
    // uint256[] ListOfFavoriteNumber;

    struct Person{
        uint256 favoriteNumber;
        string name;
    

    }
    Person [] public listOfPeople;
    // Person public You = Person({favoriteNumber:19,name:"Ilf Momin ",age:20,metamask:0xDd89B3074B601B9Ea62160350F3234A6D2B72F38});
    // Person public Me = Person({favoriteNumber:19,name:"Ilf Momin ",age:20,metamask:0xDd89B3074B601B9Ea62160350F3234A6D2B72F38});
    // Person public Who = Person({favoriteNumber:19,name:"Ilf Momin ",age:20,metamask:0xDd89B3074B601B9Ea62160350F3234A6D2B72F38});


    //Ali -> 20
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber)public{
        myfavoriteNumber = _favoriteNumber;
        
    }
    function retrieve() public view returns (uint256) {
        return myfavoriteNumber;
    }
    function addPerson(string memory _name, uint256 _favoriteNumber)public{
        // Person memory newPerson = Person( _favoriteNumber, _name);
        // listOfPeople.push(newPerson);
        listOfPeople.push(Person(_favoriteNumber,_name));
        nameToFavoriteNumber[_name]= _favoriteNumber;
 

    }
 }
 contract SimpleStorage2{}
 contract SimpleStorage3{}
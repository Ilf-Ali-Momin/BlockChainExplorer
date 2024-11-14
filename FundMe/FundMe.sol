// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import {PriceConverter} from "./PriceConverter.sol";
error NotOwner();

//constant and immutable

//737446 current gas 
contract FundMe{
   using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD =50 * 1e18; // with constant we saved around 30000 gas //7075667

    address[] public funders;
    mapping (address funder => uint256 amountFunded) public addressToAmountFunded;

address public immutable i_owner;


    constructor (){ // constructors to only give access to owner to access the withdraw function 
        
        i_owner = msg.sender;

    }

    function fund() public payable{
     // Allow user to send $, minimum 5$, how to send eth to the contract 
     require(msg.value.GetConvertionRate() >= MINIMUM_USD, "didnt send enough eth ");// 1e18 =1Eth=1000000000000000000
     funders.push(msg.sender);
     addressToAmountFunded[msg.sender]= addressToAmountFunded[msg.sender] + msg.value;
}

function withdraw()public{
    // require(msg.sender == owner, "Must be owner");
    for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
        address funder = funders[funderIndex];
        addressToAmountFunded[funder]= 0;

    }
    //reset the array
    funders = new address[](0);
    //actually withdrae the funds


//    //trasnfer
//    payable( msg.sender).transfer(address(this).balance); //this keyword refer to whole code //throw error

//    //send
//    bool sendSuccess = payable(msg.sender).send(address(this).balance); // return bool
//    require(sendSuccess, "Send Failed");

    //call
   (bool callSuccess, )= payable(msg.sender).call{value: address(this).balance}(""); //return bool
   require(callSuccess,"Call Failed");
   revert();

   
}
 modifier onlyOwner(){

    // require(msg.sender == i_owner,"Sender is not owner!");// first withdraw function
    if(msg.sender != i_owner){revert NotOwner();}
    _;// add whatever you want
 }

   
}
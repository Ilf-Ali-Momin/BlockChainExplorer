

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getPrice()internal view returns(uint256){
    //Address:0x694AA1769357215DE4FAC081bf1f309aDC325306
    //ABI
    AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);

    (,int256 answer,,,)= priceFeed.latestRoundData();
    return uint256 (answer * 1e10);
}

function GetConvertionRate(uint256 ethAmount)internal view returns(uint256) {
    //1 ETH?
    //2000_00000000000000000000
    uint256 ethPrice = getPrice();
   //(2000_00000000000000000 * 1_0000000000000000000) /1e18;
   //2000 = 1
    uint256 ethAmountInUSd = (ethPrice * ethAmount)/1e18;
    return ethAmountInUSd;
}

function GetVersion()internal view returns(uint256) {
    return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
}
}


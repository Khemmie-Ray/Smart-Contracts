// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Time { 
    function second() public view returns(uint) {
        return block.timestamp + 50 seconds;
    }

    function day() public view returns(uint){
        return block.timestamp + 1 days;
    }

    function minute() public view returns(uint){
        return block.timestamp + 3 minutes;
    }

    function hour() public view returns(uint) {
        return block.timestamp + 2 hours;
    }

}

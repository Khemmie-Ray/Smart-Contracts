// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Data {
    function getAge() external pure returns(uint){
        return 25;
    }

    function getHeight() external pure returns(uint){
        return 152;
    }

    function getName() external pure returns(string memory){
        return "Khemmie";
    }

    function getCar() external pure returns(string memory){
        return "Ferrari";
    }
}
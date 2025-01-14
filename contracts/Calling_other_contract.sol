// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Callee 컨트랙트 정의
contract Callee {
    uint256 public x;
    uint256 public value;

    function setX(uint256 _x) public returns (uint256) {
        x = _x;
        return x;
    }

    function setXandSendEther(uint256 _x) public payable returns (uint256, uint256) {
        x = _x;
        value = msg.value;
        return (x, value);
    }
}

// Caller 컨트랙트 정의
contract Caller {
    function setX(Callee _callee, uint256 _x) public {
        _callee.setX(_x);
    }

    function setXFromAddress(address _addr, uint256 _x) public {
        Callee callee = Callee(_addr);
        callee.setX(_x);
    }

    function setXandSendEther(Callee _callee, uint256 _x) public payable {
        _callee.setXandSendEther{value: msg.value}(_x);
    }
}
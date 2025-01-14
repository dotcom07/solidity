// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract MyContract {
    uint public value;
    address public owner;

    // 생성자
    constructor(uint _value) {
        value = _value;
        owner = msg.sender;
    }

    // 상태 변수 반환 함수
    function getValue() public view returns (uint) {
        return value;
    }

    function getOwner() public view returns (address) {
        return owner;
    }
}
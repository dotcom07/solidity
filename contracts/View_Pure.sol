// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ViewAndPure {
    uint256 public x = 1;

    // 상태를 변경하지 않음을 보장하는 함수
    function addToX(uint256 y) public view returns (uint256) {
        return x + y;
    }

    // 상태를 읽거나 변경하지 않음을 보장하는 함수
    function add(uint256 i, uint256 j) public pure returns (uint256) {
        return i + j;
    }
}
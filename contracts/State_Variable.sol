// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24; 

contract SimpleStorage {
    // num 값을 저장하기 위한 State 변수 선언
    uint256 public num;

    // State 변수의 값을 설정하는 경우, 트랜잭션을 보낸다.
    function set(uint256 _num) public {
        num = _num;
    }

    // State 변수의 값을 조회하는 경우, 트랜잭션을 보내지 않는다. 
    function get() public view returns (uint256) {
        return num;
    }
}

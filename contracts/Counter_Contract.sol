// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Counter {
    // unsigned / 256-bit (32bytes) / Fixed size 256bits
    uint256 public count;

    // 현재 count 값을 get하는 함수 
    function get() public view returns (uint256) {
        return count;
    }

    // count 1씩 증가하는 함수 
    function inc() public {
        count += 1;
    }

    // count 1씩 감소하는 함수
    function dec() public {
        // count > 0 인 경우 실행, count <= 0, default 값 "Counter is already zero" 출력
        require(count > 0, "Counter is already zero");
        count -= 1;
    }
} 

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Enum {
    // 배송 상태를 나타내는 Enum 정의
    enum Status {
        Pending,   // 0
        Shipped,   // 1
        Accepted,  // 2
        Rejected,  // 3
        Canceled   // 4
    }

    // 기본값은 Enum 정의의 첫 번째 값으로 설정됩니다. 여기서는 "Pending"
    Status public status;

    // 상태 값을 반환하는 함수
    function get() public view returns (Status) {
        return status;
    }

    // 상태 값을 업데이트하는 함수
    function set(Status _status) public {
        status = _status;
    }

    // 특정 Enum 값으로 상태를 업데이트하는 함수
    function cancel() public {
        status = Status.Canceled;
    }

    // 상태를 초기값으로 재설정하는 함수
    function reset() public {
        delete status; // 기본값인 Pending으로 재설정
    }
}
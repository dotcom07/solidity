// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract FunctionModifier {
    // 이 변수들을 사용하여 함수 수정자의 사용법을 시연한다.
    address public owner;
    uint256 public x = 10;
    bool public locked;

    constructor() {
        // 계약의 소유자를 트랜잭션의 발신자로 설정한다.
        owner = msg.sender;
    }

    // 계약의 소유자인지 확인하는 수정자다.
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        // 언더스코어(_)는 함수 수정자 내부에서만 사용되는 특별한 문자로,
        // Solidity에게 나머지 코드를 실행하도록 지시한다.
        _;
    }

    // 입력된 주소가 유효한지 확인하는 수정자입니다.
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    // 소유자를 변경하는 함수입니다.
    // 이 함수는 소유자만 호출할 수 있으며, 유효한 주소가 입력되어야 한다.
    function changeOwner(address _newOwner)
        public
        onlyOwner
        validAddress(_newOwner)
    {
        owner = _newOwner;
    }

    // 함수가 실행 중일 때 재진입을 방지하는 수정자다.
    modifier noReentrancy() {
        require(!locked, "No reentrancy");

        locked = true;
        _;
        locked = false;
    }

    // 재진입 방지 기능이 적용된 함수다.
    function decrement(uint256 i) public noReentrancy {
        x -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }
}
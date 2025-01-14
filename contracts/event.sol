// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Event {
    // 이벤트 선언
    // 최대 3개의 매개변수를 인덱싱할 수 있다.
    // 인덱싱된 매개변수는 로그를 필터링할 때 유용하다.
    event Log(address indexed sender, string message);
    event AnotherLog();

    // 테스트 함수
    function test() public {
        // 이벤트 호출
        emit Log(msg.sender, "Hello World!");
        emit Log(msg.sender, "Hello EVM!");
        emit AnotherLog();
    }
}
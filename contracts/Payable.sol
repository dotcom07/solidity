// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Payable {
    // Payable address는 transfer나 send를 통해 ether를 보낼 수 있다.
    address payable public owner;

    // Payable constructor는 ether를 받을 수 있다.
    constructor() payable {
        owner = payable(msg.sender); // smart contract 소유자를 설정
    }

    // 이 smart contract에 ether를 입금하는 함수
    // 이 function을 ether와 함께 호출하면, smart contract의 잔고가 자동으로 업데이트된다.
    function deposit() public payable {}

    // 이 function을 ether와 함께 호출하면, 오류가 발생한다. 이 function은 Payable이 아니다.
    function notPayable() public {}

    // 이 smart contract에서 모든 ether를 인출하는 function
    function withdraw() public {
        // 이 smart contract에 저장된 ether의 양을 가져온다.
        uint256 amount = address(this).balance;

        // 모든 ether를 소유자에게 전송한다.
        (bool success,) = owner.call{value: amount}("");
        require(success, "Failed to send Ether"); // Ether 전송 실패 시 오류 발생
    }

    // 이 smart contract에서 입력된 address로 ether를 전송하는 function
    function transfer(address payable _to, uint256 _amount) public {
        // "_to"가 Payable로 선언되어 있는지 확인한다.
        (bool success,) = _to.call{value: _amount}("");
        require(success, "Failed to send Ether"); // Ether 전송 실패 시 오류 발생
    }
}
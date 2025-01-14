// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ReceiveEther {
    /*
    어떤 함수가 호출 되는가?

           Ether 전송
               |
         msg.data가 비어있는가?
              / \
            예    아니오
            /       \
    receive()의 유무  fallback()
         /   \
       있다    없다
       /        \
    receive()   fallback()
    */

    // msg.data가 비어 있을 때 Ether를 받는 함수.
    receive() external payable {}

    // msg.data가 있을 때 Ether를 받는 함수.
    fallback() external payable {}

    // balance 확인
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        // 현재는 Ether를 전송하는데 이 함수를 사용하는 것을 권장하지 않는다.
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        // send()함수는 성공 여부를 bool 값으로 return한다.
        // transfer 함수와 마찬가지로 Ether를 전송하는데 이 함수를 사용하는 것을 권장하지 않는다.
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
        // call()함수는 성공 여부를 bool 값으로 return한다.
        // 현재는 Ether를 전송하는데 이 함수를 사용할 것을 권장한다.
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}
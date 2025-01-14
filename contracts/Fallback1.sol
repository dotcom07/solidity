// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Fallback {
    event Log(string func, uint256 gas);

    // Fallback 함수는 external로 선언되어야 한다.
    fallback() external payable {
        // send / transfer (이 fallback함수에 2300의 가스를 전달한다.)
        // call (모든 가스를 전달한다.)
        emit Log("fallback", gasleft());
    }

    // Receive 는 msg.data가 비었을 때 fallback 대신에 호출된다.
    receive() external payable {
        emit Log("receive", gasleft());
    }

    // 이 contract의 balance를 확인시켜주는 함수이다.
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

contract SendToFallback {
    function transferToFallback(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function callFallback(address payable _to) public payable {
        (bool sent,) = _to.call{value: msg.value}("0x1234");
        require(sent, "Failed to send Ether");
    }
}


// TestFallbackInputOutput -> FallbackInputOutput -> Counter
contract FallbackInputOutput {
    address immutable target;

    constructor(address _target) {
        target = _target;
    }

    fallback(bytes calldata data) external payable returns (bytes memory) {
        (bool ok, bytes memory res) = target.call{value: msg.value}(data);
        require(ok, "call failed");
        return res;
    }
}

contract Counter {
    uint256 public count;

    function get() external view returns (uint256) {
        return count;
    }

    function inc() external returns (uint256) {
        count += 1;
        return count;
    }
}

contract TestFallbackInputOutput {
    event Log(bytes res);

    function test(address _fallback, bytes calldata data) external {
        (bool ok, bytes memory res) = _fallback.call(data);
        require(ok, "call failed");
        emit Log(res);
    }

    function getTestData() external pure returns (bytes memory, bytes memory) {
        return
            (abi.encodeCall(Counter.get, ()), abi.encodeCall(Counter.inc, ()));
    }
}
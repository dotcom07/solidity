// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Variables {
    // State variable들은 블록체인에 저장됩니다. 
    string public text = "Hello";
    uint256 public num = 123;

    function doSomething() public returns (uint256, address) {
        // Local variable들은 블록체인에 저장되지 않습니다. 
        uint256 i = 456;
        num = num + i;

        // Global variable들은 아래와 같이 사용되어 원하는 데이터를 가져올 수 있습니다. 
        uint256 timestamp = block.timestamp; // 현재의 블록의 타임스탬프 
        address sender = msg.sender; // 컨트랙트 호출자의 주소 

        return (timestamp, sender);
    }
}
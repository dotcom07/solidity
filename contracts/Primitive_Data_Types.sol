// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Primitives {
    bool public boo = true;

    /*
    uint는 부호 없는 정수를 의미하며, 음수가 아닌 정수이다.
    다양한 크기의 부호 없는 정수가 제공됩니다.
        uint8   범위: 0 ~ 2 ** 8 - 1
        uint16  범위: 0 ~ 2 ** 16 - 1
        ...
        uint256 범위: 0 ~ 2 ** 256 - 1
    */
    uint8 public u8 = 1;
    uint256 public u256 = 456;
    uint256 public u = 123; // uint는 uint256의 별칭이다.

    /*
    int 타입은 음수를 허용한다.
    uint와 마찬가지로 다양한 크기의 부호 있는 정수가 제공된다.
    
    int256의 범위: -2 ** 255 ~ 2 ** 255 - 1
    int128의 범위: -2 ** 127 ~ 2 ** 127 - 1
    */
    int8 public i8 = -1;
    int256 public i256 = 456;
    int256 public i = -123; // int는 int256과 동일하다.

    // int 타입의 최소값과 최대값
    int256 public minInt = type(int256).min;
    int256 public maxInt = type(int256).max;

    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    /*
    Solidity에서 byte 타입은 바이트의 시퀀스를 나타낸다.
    Solidity는 두 가지 타입의 바이트 배열을 제공한다.

     - 고정 크기 바이트 배열
     - 동적 크기 바이트 배열
     
     Solidity에서 bytes는 동적 크기 바이트 배열을 나타내며, byte[]의 축약형이다.
    */
    bytes1 public a = 0xb5; //  [10110101]
    bytes1 public b = 0x56; //  [01010110]

    // 기본값
    // 초기화되지 않은 변수는 기본값을 가진다.
    bool public defaultBoo; // false
    uint256 public defaultUint; // 0
    int256 public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract DataLocations {
    uint256[] public arr;
    mapping(uint256 => address) public map;

    struct MyStruct {
        uint256 foo;
    }

    mapping(uint256 => MyStruct) public myStructs;

    // 상태 변수를 초기화하는 함수
    function initialize() public {
        arr.push(1);
        arr.push(2);
        arr.push(3);
        map[1] = msg.sender;
        myStructs[1] = MyStruct(42);
    }

    function f() public {
        // 상태 변수를 참조하여 _f 함수 호출
        _f(arr, map, myStructs[1]);

        // 매핑에서 구조체를 가져오기 (storage 위치)
        MyStruct storage myStruct = myStructs[1];
        // storage 구조체 값을 변경
        myStruct.foo = 100;

        // 메모리에 구조체 생성 (memory 위치)
        MyStruct memory myMemStruct = MyStruct(0);
        myMemStruct.foo = 200;
    }

    // storage 위치의 변수를 인수로 받는 내부 함수
    function _f(
        uint256[] storage _arr,
        mapping(uint256 => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
        // storage 변수와 관련된 작업 수행
        _arr.push(4); // arr 배열에 값 추가
        _map[2] = msg.sender; // map에 새로운 키-값 쌍 추가
        _myStruct.foo = 50; // 구조체 값 변경
    }

    // memory 위치의 배열을 반환하는 함수
    function g(uint256[] memory _arr) public pure returns (uint256[] memory) {
        // memory 배열과 관련된 작업 수행
        uint256[] memory newArray = new uint256[](_arr.length);
        for (uint256 i = 0; i < _arr.length; i++) {
            newArray[i] = _arr[i] * 2;
        }
        return newArray;
    }

    // calldata 위치의 배열을 사용하는 외부 함수
    function h(uint256[] calldata _arr) external pure returns (uint256) {
        // calldata 배열과 관련된 작업 수행
        uint256 sum = 0;
        for (uint256 i = 0; i < _arr.length; i++) {
            sum += _arr[i];
        }
        return sum;
    }

    // 배열 길이를 반환하는 함수
    function getArrLength() public view returns (uint256) {
        return arr.length;
    }

    // 배열 요소를 반환하는 함수
    function getArrElement(uint256 index) public view returns (uint256) {
        require(index < arr.length, "Index out of bounds");
        return arr[index];
    }

    // 특정 구조체 값을 반환하는 함수
    function getMyStruct(uint256 key) public view returns (uint256) {
        return myStructs[key].foo;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Array {
    // Array를 초기화하는 여러가지 방법입니다.
    uint256[] public arr;
    uint256[] public arr2 = [1, 2, 3];
    // 고정된 크기의 array는 모든 값이 0으로 초기화된다.
    uint256[10] public myFixedSizeArr;

    // i번째 index에 있는 array 값 반환하는 함수이다.
    function get(uint256 i) public view returns (uint256) {
        return arr[i];
    }

    // Solidity에서는 array 전체를 반환할 수 있다.
    // Array의 길이가 굉장히 커질 수 있어서 사용하지 않는 것을 추천한다.
    function getArr() public view returns (uint256[] memory) {
        return arr;
    }

    function push(uint256 i) public {
        // python에서 append와 비슷한 함수다.
        // array 마지막에 값을 추가하고, array의 길이는 1증가한다.
        arr.push(i);
    }

    function pop() public {
        // python에서 pop과 비슷한 함수다.
        // array의 마지막 값을 삭제하고, array의 길이는 1 감소한다.
        arr.pop();
    }

    // array의 길이를 반환하는 함수다.
    function getLength() public view returns (uint256) {
        return arr.length;
    }

    function remove(uint256 index) public {
        // delete는 array 길이에 영향을 주지 않다.
        // 기존에 있었던 값으로 reset한다, 이 경우에는 0으로 값이 바뀐다.
        delete arr[index];
    }
}
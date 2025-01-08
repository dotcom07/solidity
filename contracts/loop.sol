// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
   
contract ForLoopExample {
    // 배열 선언, 배열은 Array 파트에서 배우게 된.
    uint[] public numbers = [1,2,3,4];


    // 배열에 저장된 숫자들의 합을 계산하는 함수
    function sumNumbers() public view returns (uint) {
        uint sum = 0;
        // for 루프를 사용하여 배열의 각 요소를 합산
        for (uint i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        return sum;
    }
}

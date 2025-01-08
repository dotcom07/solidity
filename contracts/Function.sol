// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Function {
    // 함수는 여러 값을 반환할 수 있다.
    function returnMany() public pure returns (uint256, bool, uint256) {
        return (1, true, 2);
    }

    // 반환 값을 이름으로 명명할 수 있다.
    function named() public pure returns (uint256 x, bool b, uint256 y) {
        return (1, true, 2);
    }

    // 반환 값을 이름에 할당할 수 있다.
    // 이 경우 return 문을 생략할 수 있다.
    function assigned() public pure returns (uint256 x, bool b, uint256 y) {
        x = 1;
        b = true;
        y = 2;
    }

    // 여러 값을 반환하는 다른 함수를 호출할 때 구조 분해 할당을 사용한다.
    function destructuringAssignments()
        public
        pure
        returns (uint256, bool, uint256, uint256, uint256)
    {
        (uint256 i, bool b, uint256 j) = returnMany();

        // 값을 생략할 수 있다.
        (uint256 x,, uint256 y) = (4, 5, 6);

        return (i, b, j, x, y);
    }

    // 배열을 입력으로 사용할 수 있다.
    function arrayInput(uint256[] memory _arr) public {}

    // 배열을 출력으로 사용할 수 있다.
    uint256[] public arr;

    function arrayOutput() public view returns (uint256[] memory) {
        return arr;
    }
}

// 키-값 입력으로 함수 호출
contract XYZ {
    function someFuncWithManyInputs(
        uint256 x,
        uint256 y,
        uint256 z,
        address a,
        bool b,
        string memory c
    ) public pure returns (uint256) {}

    function callFunc() external pure returns (uint256) {
        return someFuncWithManyInputs(1, 2, 3, address(0), true, "c");
    }

    function callFuncWithKeyValue() external pure returns (uint256) {
        return someFuncWithManyInputs({
            a: address(0),
            b: true,
            c: "c",
            x: 1,
            y: 2,
            z: 3
        });
    }
}
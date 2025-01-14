// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Error {
    function testRequire(uint256 _i) public pure {
        // Require은 다음과 같은 조건을 검증하는데 사용해야 한다.
        // - 입력
        // - 실행 전 조건
        // - 다른 함수 호출의 return 값
        require(_i > 10, "Input must be greater than 10");
    }

    function testRevert(uint256 _i) public pure {
        // Revert는 확인하려는 조건이 복잡할 때 유용하다.
        // 이 코드는 위의 예와 똑같은 작업을 수행한다.
        if (_i <= 10) {
            revert("Input must be greater than 10");
        }
    }

    uint256 public num;

    function testAssert() public view {
        // Assert는 내부 error를 테스트하고 불변성을 확인하는 데에만 사용해야 한다.

        // 여기서 num 값을 업데이트 하는 것은 불가능하기 때문에 num이 항상 0과 같다는 것임을 확신한다.
        assert(num == 0);
    }

    // custom error
    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function testCustomError(uint256 _withdrawAmount) public view {
        uint256 bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({
                balance: bal,
                withdrawAmount: _withdrawAmount
            });
        }
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Base {
    // Private function can only be called
    // - inside this contract
    // Contracts that inherit this contract cannot call this function.
    function testPrivateFunc() public pure returns (string memory) {
        return privateFunc();
    }

    // Internal function can be called
    // - inside this contract
    // - inside contracts that inherit this contract

    function testInternalFunc() public pure virtual returns (string memory) {
        return internalFunc();
    }

    function privateFunc() internal pure returns (string memory) {
        return "private function called";
    }

    // Change internalFunc to public
    function internalFunc() public pure returns (string memory) {
        return "internal function called";
    }

    // Change publicFunc to external
    function publicFunc() external pure returns (string memory) {
        return "public function called";
    }

    // This function will not compile since we're trying to call
    // an external function here.
    // function testExternalFunc() public pure returns (string memory) {
    //     return externalFunc();
    // }

    // State variables
    string private privateVar = "my private variable";
    string internal internalVar = "my internal variable";
    string public publicVar = "my public variable";
    // State variables cannot be external so this code won't compile.
    // string external externalVar = "my external variable";

        // Getter functions for state variables
    function getPrivateVar() public view returns (string memory) {
        return privateVar;
    }

    function getInternalVar() public view returns (string memory) {
        return internalVar;
    }

    // publicVar는 자동으로 getter 함수가 생성됨

}

contract Child is Base {
    // Inherited contracts do not have access to private functions
    // and state variables.
    // function testPrivateFunc() public pure returns (string memory) {
    //     return privateFunc();
    // }

    // Internal function can be called inside child contracts.
    function testInternalFunc() public pure override returns (string memory) {
        return internalFunc();
    }


}

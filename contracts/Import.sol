// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// import Foo.sol from current directory
import "./Foo.sol";

contract Import {
    // Initialize Foo.sol
    Foo public foo = new Foo();

    // Test Foo.sol by getting its name
    function getFooName() public view returns (string memory) {
        return foo.name();
    }
}
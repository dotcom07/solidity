// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract EtherUnits {
    uint256 public oneWei = 1 wei;
    uint256 public oneGwei = 1 gwei;
    uint256 public oneEther = 1 ether;

    // 1 wei == 1 확인하는 bool
    bool public isOneWei = (oneWei == 1);

    // 1 gwei == 1e9 (10**9) 확인하는 bool
    bool public isOneGwei = (oneGwei == 1e9);

    // 1 ether == 1e18 (10**18) 확인하는 bool
    bool public isOneEther = (oneEther == 1e18);
}
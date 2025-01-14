// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// 간단한 Counter를 구현한 contract
contract Counter {
    uint256 public count;

    function increment() external {
        count += 1;
    }
}

// ICounter interface를 사용하여 Counter contract과 상호 작용하는 contract
interface ICounter {
    function count() external view returns (uint256);
    function increment() external;
}

contract MyContract {
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns (uint256) {
        return ICounter(_counter).count();
    }
}


// Uniswap example
interface UniswapV2Factory {
    function getPair(address tokenA, address tokenB)
        external
        view
        returns (address pair);
}

interface UniswapV2Pair {
    function getReserves()
        external
        view
        returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}

contract UniswapExample {
    address private factory = 0xc9f18c25Cfca2975d6eD18Fc63962EBd1083e978;
    address private token1 = 0x0625aFB445C3B6B7B929342a04A22599fd5dBB59;
    address private weth = 0xfFf9976782d46CC05630D1f6eBAb18b2324d6B14;

    function getTokenReserves() external view returns (uint256, uint256) {
        address pair = UniswapV2Factory(factory).getPair(token1, weth);
        (uint256 reserve0, uint256 reserve1,) =
            UniswapV2Pair(pair).getReserves();
        return (reserve0, reserve1);
    }
}

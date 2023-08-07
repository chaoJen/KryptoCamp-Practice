// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2;

/**
 * Interface
 */
contract Chapter12 {

    uint public count;

    function increment() external {
        count += 1;
    }
}

interface Counter {

    function count() external view returns (uint);

    function increment() external;
}

contract MyContract {

    function incrementCounter(address _counter) external {
        Counter(_counter).increment();
    }

    function getCount(address _counter) external view returns (uint) {
        return Counter(_counter).count();
    }
}

// 抽象合約
abstract contract Feline {

    function utterance() public pure virtual returns (bytes32);
}

contract Cat is Feline {

    function utterance() public pure override returns (bytes32) {
        return "miaow";
    }
}
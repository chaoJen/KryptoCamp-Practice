// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2;

import "contracts/Chapter12.sol" as util;

/**
 * Import & Libraries
 *
 * - Library
 * - Import
 * - OpenZeppelin
 */
contract Chapter13 {
    
    using LibEmbedded for uint;

    function add(uint a, uint b) internal pure returns (uint) {
        return a.add(b);
    }
}

/**
 * library 不可宣告任何的 state variables，也無法傳送任何 eth，只會被部署一次，無法繼承或被繼承
 * 
 * - deployed 有自己的合約地址，可以被智能合約在執行時呼叫
 * - embedded 當所有函數皆為 internal；沒有自己的合約地址，會變成我們合約的一部份程式碼
 */
library LibEmbedded {

    function add(uint a, uint b) internal pure returns (uint) {
        return a + b;
    }
}

library LibDeplyed {

    function add(uint a, uint b) public pure returns (uint) {
        return a + b;
    }
}
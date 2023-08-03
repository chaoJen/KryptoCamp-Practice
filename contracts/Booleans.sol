// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2;

/**
 * 邏輯運算使用 && ||
 */
contract Booleans {

    constructor() {}

    bool public isActive = false;

    function change() public returns (bool) {
        isActive = !isActive;
        return isActive;
    }
}
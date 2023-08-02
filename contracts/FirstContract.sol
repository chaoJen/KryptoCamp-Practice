// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2;

contract FirstContract {

    // something
    uint private myVar;

    /* function */
    function get() public view returns (uint) {
        return myVar;
    }

    function set(uint x) public {
        myVar = x;
    }
}
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2;

struct Point {
    uint x;
    uint y;
}

error Unauthorized(address caller);

function add(uint x, uint y) pure returns (uint) {
    return x + y;
}

contract Foo {
    
    string public name = "Foo";
}

contract SomeOtherContract {
    
}
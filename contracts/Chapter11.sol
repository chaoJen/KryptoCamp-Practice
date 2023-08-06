// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2;

import "./Chapter11-1.sol";

/**
 * Inheritance
 *
 * C3 Linearization 演算法
 */
contract Chapter11 is B {

    // 呼叫父合約的建構子
    constructor() B() {

    }
}

contract Owner {

    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    modifier costs(uint _price) {
        if (msg.value >= _price) {
            _;
        }
    }
}

/**
 * Modifier
 *
 * 對一個函式進行補充敘述，或者在滿足 modifier 定義的特定條件後才執行函式的內容
 */
contract Register is Owner {

    mapping (address => bool) public registeredAddresses;
    uint price;

    constructor(uint initialPrice) {
        price = initialPrice;
    }

    function register() public payable costs(price) {
        registeredAddresses[msg.sender] = true;
    }

    function changePrice(uint _price) public onlyOwner {
        price = _price;
    }
}
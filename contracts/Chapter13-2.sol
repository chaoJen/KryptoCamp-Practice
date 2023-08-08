// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2;

import "./Chapter13-1.sol";
import {Unauthorized, add as func, Point} from "./Chapter13-1.sol";

/**
 * OpenZeppelin 是一個智能合約庫，其中包含了經過社區審查的 ERC 代幣標準、安全協議以及其他輔助工具，使用 OpenZeppelin 可以極大的提高 Solidity 合約的開發效率並保證合約的安全性。
 * 常見如：
 * - Ownable
 * - SafeMath
 * - SafeCast
 * - ERC20/ERC721/ERC1155
 */
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.9/contracts/access/AccessControl.sol";

contract Chapter13_2 {

    Foo public foo = new Foo();

    function getFooName() public view returns (string memory) {
        return foo.name();
    }
}

contract NewContract is SomeOtherContract {

}
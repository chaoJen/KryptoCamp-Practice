// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * ERC & Token
 *
 * - ERC20 Fungible Tokens
 * - ERC721 Non-Fungible Tokens: 透過 etherscan Read Contract 可以找到詳細內容資訊，包含描述與圖檔位置
 * - ERC1155 Semi-Fungible Tokens
 *
 * EIP(Ethereum Improvement Proposal)
 * ERC(Ethereum Request for Comments)
 */
contract Chapter14 {

}

/**
 * - 穩定幣
 * - 安全代幣
 * - 功能型代幣
 */
contract GLDToken is ERC20 {

    constructor(uint256 _initialSupply) ERC20("Gold", "GLD") {
        _mint(msg.sender, _initialSupply);
    }
}
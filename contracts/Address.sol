// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2;

/**
 * Address 可用於指向以太坊帳戶或智能合約地址
 *
 * - Externally Owned Account (EOA)
 * - Contract Account
 */
contract Address {
    
    address public owner = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    address public contractAddress = address(this); // 加上 address() 就有就有 transfer、send Function
    uint256 public balanceOfMyContract = contractAddress.balance;
    // address payable 代表可用於支付的地址
    // msg.sender; 呼叫此函式的錢包或合約地址

    function getOwnerBalance() public view returns (uint256) {
        return owner.balance;
    }

    // (2300 gas, throws error)
    function sendValueByTransfer(address to) public {
        payable(to).transfer(15 ether);
    }

    // (2300 gas, returns bool)
    function sendValueTo(address to) public {
        bool sent = payable(to).send(15 ether);
        require(sent, "Failed to send Ether");
    }

    // call (forward all gas or set gas, returns bool)
    function sendValueByCallTo(address to) public {
        (bool sent, bytes memory data) = to.call{value: 15 ether}("");
        data;
        require(sent, "Failed to send Ether");
    }

    receive() external payable  {}
    fallback() external payable {}
}
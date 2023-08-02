// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2;

contract Address {
    address public owner = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;


    function getOwnerBalance() public view returns (uint256) {
        return owner.balance;
    }

    // (2300 gas, throws error)
    function sendValueByTransfer(address to) public {
        payable(owner).transfer(15 ether);
    }

    // (2300 gas, returns bool)
    function sendValueTo(address to) public {
        bool sent = payable(owner).send(15 ether);
        require(sent, "Failed to send Ether");
    }

    // call (forward all gas or set gas, returns bool)
    function sendValueByCallTo(address to) public {
        (bool sent, bytes memory data) = owner.call{value: 15 ether}("");
        data;
        require(sent, "Failed to send Ether");
    }

    receive() external payable  {}
    fallback() external payable {}
}
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2;

contract Struct {
    
    struct User {
        address id;
        string name;
        uint256 age;
    }

    User owner;

    constructor(string memory _name, uint256 _age) {
        owner = User({
            id: msg.sender, 
            name: _name,
            age: _age
        });
    }

    function getOwnerAddress() public view returns (address) {
        return owner.id;
    }

    function getOwnerName() public view returns (string memory) {
        return owner.name;
    }
}
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2;

/**
 * Data Structures
 * 
 * - Array
 * - Mapping
 * - Struct
 * - Enum
 */
contract Chapter6 {

}

contract Array {
    uint256[] arr_1;
    uint256[] arr_2 = [3, 2, 4];
    uint256[5] arr_3;
    uint256[][] array2D = [[1, 2, 3], [4, 5, 6]];

    constructor(uint256 _dynamicArrayLength) {
        arr_1 = new uint256[](_dynamicArrayLength);
    }

    function getValueOfIndex(uint256 _index) public view returns (uint256) {
        return arr_2[_index];
    }

    function addToArray(uint256 _value) public {
        arr_2.push(_value);
    }

    function valueCount() public view returns (uint256) {
        return arr_3.length;
    }

    function dynamicValueCount() public view returns (uint256) {
        return arr_1.length;
    }
}

contract Mapping {
    mapping(uint256 => address) nfts;
    uint256 counter = 0;

    function ownerOf(uint256 _tokenId) public view returns (address) {
        return nfts[_tokenId];
    }

    function mintNFT() public {
        nfts[counter] = msg.sender;
        counter++;
    }
}

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

contract Enum {
    
    enum Rarity {
        original, // 0
        rare, // 1
        super_rare // 2
    }

    Rarity public rarity;

    constructor() {
        rarity = Rarity.original;
    }

    function makeSuperRare() public {
        rarity = Rarity.super_rare;
    }

    function reset() public {
        delete rarity;
    }
}
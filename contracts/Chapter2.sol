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

// Solidity 沒有浮點數型態 float or double

contract Integer {
    
    constructor() {}

    uint256 public myUint = 566778778787;
    uint32 public myUint32 = 4294967295;
    uint16 public myUint16 = 65535;
    uint8 public myUint8 = 255;

    int256 public myInt = -566778778787;
    int32 public myInt32 = -2147483648;
    int16 public myInt16 = -32768;
    int8 public myInt8 = -128;

    uint8 public uint8_max = 2**8 - 1;
    uint8 public uint8_min = 0;

    int8 public int8_max = type(int8).max;
    int8 public int8_min = type(int8).min;
}

contract String {

    constructor() {}

    string public message = "hello, Solidity";
    string data_moreGas = "test";
    bytes data_lessGas = "test";
}

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

contract Bytes {
    bytes1 public hex1 = 0xFF;
    bytes32 public hex32 = 0x0102030405060708091011121314151617181920212223242526272829303132;

    constructor() {}
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
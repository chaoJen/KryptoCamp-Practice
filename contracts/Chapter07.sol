// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2;

/**
 * Global Variables
 * 
 * - Msg
 * - Block
 * - ABI
 * - TX
 */
contract Chapter7 {

    // msg.data
    // msg.sender
    // msg.value
    // msg.gas / gasleft()
    mapping (address => uint) favoriteNumber;

    function setMyNumber(uint _myNumber) public {
        favoriteNumber[msg.sender] = _myNumber;
    }

    function whatIsMyNumber() public view returns (uint) {
        return favoriteNumber[msg.sender];
    }

    // block.basefee 當前區塊的基本費用當前區塊的基本費用 (EIP-3198, EIP-1559)
    // block.chainid 當前的當前的 chain id
    // block.coinbase 當前區塊礦工地址
    // block.difficulty 當前區塊難度
    // block.gaslimit 當前區塊的 gas limit
    // block.number 當前區塊編號
    // block.timestamp 當前區塊的 timestamp (UNIX)。建議不要依賴作為隨機數 seed
    
    // abi.decode(bytes memory encodedData, (...)) returns (...) 對特定資料進行 ABI 解碼解碼
    // abi.encode(...) returns (bytes memory) 對特定參數進行 ABI 編碼編碼
    // abi.encodePacked(...) returns (bytes memory) 對給定參數執行非特定的包裝模式編碼 (Non-standard Packed Mode)
    // abi.encodeWithSelector(bytes4 selector, ...) returns (bytes memory) 對特定參數從第二個或前置特定的 4bytes selector 來做 ABI-encodes
    // abi.encodeWithSignature(string memory signature, ...) returns (bytes memory) 效用等同於 abi.encodeWithSelector(bytes4(keccak256(bytes(signature))), ...)

    // Cryptographic Functions
    //
    // - blockhash
    // - keccak256
    // - sha256
    // - ripend160
    // - ecrecover

    // transaction (TX)
    //
    // tx.gasprice
    // tx.origin
}
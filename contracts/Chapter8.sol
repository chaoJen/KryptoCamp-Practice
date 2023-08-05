// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2;

/**
 * Memory Allocation
 * 
 * - Call by Reference vs. Call by Value
 * - Data Locations: Storage, Memory and Calldata
 */
contract Chapter8 {

    uint public a = 1;
    uint public b = 0;

    function swap() public {
        (a, b) = (b, a);
    }

    // Call by Value: bool, uint, bytes, address
    // Call by Reference: array, struct, mapping, string
    // 習慣上函式的參數名稱前面會用 _

    // Storage 變數永遠地被儲存在區塊鏈中
    // Memory 暫時存在
    // State variable 會預設為會 Storage，區域變數、函式參數預設為 memory
    // calldata 類似 memory，用於 external 函式的參數，唯讀不可變
    function memoryTest(string memory _exampleString) public pure returns (string memory) {
        _exampleString = "example";
        string memory newString = _exampleString;
        return newString;
    }

    function calldataTest(string calldata _exampleString) external pure returns (string memory) {
        return _exampleString;
    }

    uint8 public myUint8;

    function decrement() public {
        myUint8 -= 1;
    }

    function increment() public {
        myUint8 += 1;
    }
}
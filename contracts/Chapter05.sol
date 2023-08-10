// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2;

/*
 * 函式函式 Function
 * 
 * - Writing Transactions
 * - Reading Transactions
 *
 * 能呼叫函式者
 * - MyContract 當前合約: internal
 * - DerivedContract 繼承合約: internal
 * - AnotherContract 其他合約: external
 *
 * Visibility
 * - public
 * - private
 * - external 只有除了自己和繼承合約以外能呼叫
 * - internal
 *
 * State Mutability
 * - pure: 不允許修改或訪問狀態變量
 * - view: 不允許修改狀態變量
 * - payable: 允許函式在呼叫同時接收由 msg.value 或者其他匯款函式傳來的以太幣，只有宣告 payable 的物件才可以進行交易
 * - Pure Function 不可閱讀也不可更改任何狀態變數，只能呼叫其他的只能呼叫其他的 Pure Function
 * - View Function 可閱讀但不可更改任何狀態變量，可以呼叫 Pure Function、View Function
 */
contract Chapter5 {

    uint public x;
    uint public y;
    uint public z;
    
    /**
     * - 一個合約只能有一個 Constructor
     * - 可以為 public 或 internal
     * - 如為 internal 則其為 Abstract Contract
     * - 可以帶入參數
     */
    constructor() {
        x = 0;
    }

    function myFunction() public pure returns (bool) {
        return true;
    }

    /*
     * 多個回傳值
     */
    function multipleReturns() public pure returns (uint a, uint b, uint c) {
        return (1, 2, 3);
    }

    function proccessMultipleReturns() external {
        // 一次賦值多個變數
        (x, y, z) = multipleReturns();
    }

    function getLastReturnValue() external {
        // 只賦值其中一個變數
        (,,z) = multipleReturns();
    }

    function getSum(uint a, uint b) public pure returns(uint) {
        return a + b;
    }

    function getSum(uint a, uint b, uint c) public pure returns(uint) {
        return a + b + c;
    }

    function getSumWithTwoArguments() public pure returns (uint) {
        return getSum(1, 2);
    }

    function getSumWithThreeArguments() public pure returns (uint) {
        return getSum(1, 2, 3);
    }
}

contract Fallback {

    event Log(uint gas);

    /*
     * fallback 函式必須是函式必須是 external
     */
    fallback() external payable {
        // send / transfer (forwards 2300 gas to this fallback function)
        // call (forwards all of the gas)
        emit Log(gasleft());
    }

    receive() external payable  {
        
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendToFallback {
    
    function transferToFallback(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function callFallback(address payable _to) public payable {
        (bool sent,) = _to.call{value: msg.value}("");
        require(sent, "Failed tosend Ether");
    }
}
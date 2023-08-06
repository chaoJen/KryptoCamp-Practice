// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2;

/**
 * Event
 *
 * 事件是一個合約跟外部前端 app 溝通的方法，可以在前端聆聽 (listening) 合約內的特定事件或動作
 * - 透過透過 Ethereum 客戶端 RPC interface，以 subscribe 來聆聽這些事件，前端參考 web3.js
 * - Event 作為合約的一部分是可以被繼承的
 * - 合約不可以存取自己的 Event 被啟動之後的 logs 和任何相關 data
 * - 被標示 indexed 的 Event 參數可以在未來被檢索
 *
 */
contract Chapter10 {

    mapping (address => uint) public tokenBalance;
    event TokenSent(address _from, address _to, uint _amount);
    event Deposit(address indexed _from, bytes32 indexed _id, uint _value);
    event Start(uint start, uint middle, uint end) anonymous;
    event End(uint start, uint middle, uint end) anonymous;

    constructor() {
        tokenBalance[msg.sender] = 100;
    }

    function sendToken(address _to, uint _amount) public returns (bool) {
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens.");
        assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
        
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
        emit TokenSent(msg.sender, _to, _amount);

        return true;
    }
    
    function deposit(bytes32 _id) public payable {
        emit Deposit(msg.sender, _id, msg.value);
    }
}
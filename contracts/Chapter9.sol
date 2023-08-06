// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2;

/**
 * Handling Exception
 *
 * - Require 用於檢測使用者的輸入等錯誤情況
 * - Assert 用於檢測完全不該在合約裡出現的情況
 * - Revert 用於確認複雜的狀態
 * - Try/Catch
 *   - catch Error
 *   - catch Panic
 *   - catch
 */
contract Chapter9 {
    
    mapping (address => uint64) public balanceReceived;
    address public owner;

    constructor(address _owner) {
        require(_owner != address(0), "Invalid address");
        owner = _owner;
    }

    function receiveMoney() public payable {
        assert(balanceReceived[msg.sender] + uint64(msg.value) >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += uint64(msg.value);
    }

    function withdrawMoney(address payable _to, uint64 _amount) public {
        require(balanceReceived[msg.sender] >= _amount, "You don't have enough ether.");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

    function testRequire(uint _i) public pure {
        require(_i > 10, "Input must be greater than 10");
    }

    function testAssert(uint _i) public pure {
        assert(_i == 0);
    }

    function testRevert(uint _i) public pure {
        if (_i <= 10) {
            if (_i != 10) {
                revert("Input must be equal 10");
            }
        }
    }

    function myFunc(uint x) public pure returns (string memory) {
        require(x != 0, "require failed");
        return "my func wes called.";
    }
}

contract Bar {
     
     event Log(string message);
     event LogBytes(bytes data);

     Chapter9 public chapter9;

     constructor() {
         chapter9 = new Chapter9(msg.sender);
     }

     function tryCatchExternalCall(uint _i) public {
         try chapter9.myFunc(_i) returns (string memory result) {
            emit Log(result);
         } catch {
            emit Log("external call failed");
         }
     }

     function tryCatchNewContract(address _owner) public {
         try new Chapter9(_owner) returns (Chapter9) {
             emit Log("Chapter9 created");
         } catch Error(string memory reason) { // revert or require
             emit Log(reason);
         } catch (bytes memory reason) {
             emit LogBytes(reason);
         }
     }
}
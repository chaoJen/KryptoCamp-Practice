// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2;

/**
 * 1 wei == 1;
 * 1 gwei == 1e9;
 * 1 ether == 1e18;
 */
contract MyUnits {
    
    uint256 public costOfNFT = 0.0000000000005 ether;
}

contract BlockTime {
    
    uint256 public second = 1 seconds;
    uint256 public minute = 1 minutes;
    uint256 public hour = 1 hours;
    uint256 public day = 1 days;

    /**
     * Solidity 使用使用 UNIX 時間
     */
    function getBlockTime() public view returns (uint256) {
        return block.timestamp;
    }
}

/**
 * 高精度運算
 */
contract MOD {

    function callAddMod() public pure returns (uint) {
        return addmod(4, 5, 3); // 0
    }

    function callMulMod() public pure returns (uint) {
        return mulmod(4, 5, 3); // 2
    }
}
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2;

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
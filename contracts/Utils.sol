// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

library Utils {

    function bytesToAddress(bytes memory data) internal pure returns (address) {
        require(data.length == 20, "Invalid address format");
        address addr;
        assembly {
            addr := mload(add(data, 20))
        }
        return addr;
    }

    function bytesToBytes32(bytes memory data, uint256 offset) internal pure returns (bytes32 result) {
        require(data.length >= offset + 32, "Invalid data length");

        assembly {
            result := mload(add(data, add(offset, 32)))
        }
    }

    function bytesToString(bytes memory data) internal pure returns (string memory) {
    return abi.decode(data, (string));
}

    
}
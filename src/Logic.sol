// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract Logic {
    uint256 public counter;

    function increase() external returns (uint256) {
        counter += 1;
        return counter;
    }

    function decrease() external returns (uint256) {
        counter -= 1;
        return counter;
    }
}

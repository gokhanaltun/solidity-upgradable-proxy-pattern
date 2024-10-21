// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract Logic2 {
    uint256 public counter;

    function increase(uint256 value) external returns (uint256) {
        counter += value;
        return counter;
    }

    function decrease(uint256 value) external returns (uint256) {
        counter -= value;
        return counter;
    }
}
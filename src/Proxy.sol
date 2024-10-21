// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract Proxy {
    uint256 public counter;
    address public logic;

    function setLogicAddr(address addr) external {
        logic = addr;
    }

    
    fallback() external payable {
        assembly {
            calldatacopy(0, 0, calldatasize())
            let impl := sload(1)
            let result := delegatecall(gas(), impl, 0, calldatasize(), 0, 0)

            returndatacopy(0, 0, returndatasize())
            switch result
            case 0 {
                revert(0, returndatasize())
            }
            default {
                return(0, returndatasize())
            }
        }
    }

    receive() external payable {}
}

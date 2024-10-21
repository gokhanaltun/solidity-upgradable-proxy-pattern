// SPDX-License-Identifier: MIT

pragma solidity ^0.8.27;

import {Test, console} from 'forge-std/Test.sol';
import "../src/Proxy.sol";
import "../src/Logic.sol";
import "../src/Logic2.sol";

contract ProxyTest is Test { 
    Proxy public proxy;
    Logic public logic;
    Logic2 public logic2;


    function setUp() public {
        proxy = new Proxy();
        logic = new Logic();
        logic2 = new Logic2();
    }

    function test_setProxyLogicAddr() public {
        proxy.setLogicAddr(address(logic));
        assertEq(proxy.logic(), address(logic));
    }

    function test_logicIncreaseFunction() public {
        proxy.setLogicAddr(address(logic));
        (bool success, bytes memory data) = address(proxy).call(abi.encodeWithSignature("increase()"));
        assertEq(success, true);
        uint256 result = abi.decode(data, (uint256));
        assertEq(result, 1);
        assertEq(proxy.counter(), 1);
    }

    function test_logicDecreaseFunction() public {
        proxy.setLogicAddr(address(logic));
        (bool increaseSuccess, ) = address(proxy).call(abi.encodeWithSignature("increase()"));
        assertEq(increaseSuccess, true);
        assertEq(proxy.counter(), 1);

        (bool decreaseSuccess, bytes memory data) = address(proxy).call(abi.encodeWithSignature("decrease()"));
        assertEq(decreaseSuccess, true);

        uint256 result = abi.decode(data, (uint256));
        assertEq(result, 0);
        assertEq(proxy.counter(), 0);
    }

    function test_logic2IncreaseFunction() public {
        proxy.setLogicAddr(address(logic2));
        (bool success, bytes memory data) = address(proxy).call(abi.encodeWithSignature("increase(uint256)", 10));
        assertEq(success, true);
        uint256 result = abi.decode(data, (uint256));
        assertEq(result, 10);
        assertEq(proxy.counter(), 10);
    }

    function test_logic2DecreaseFunction() public {
        proxy.setLogicAddr(address(logic2));
        (bool increaseSuccess, ) = address(proxy).call(abi.encodeWithSignature("increase(uint256)", 10));
        assertEq(increaseSuccess, true);
        assertEq(proxy.counter(), 10);

        (bool decreaseSuccess, bytes memory data) = address(proxy).call(abi.encodeWithSignature("decrease(uint256)", 5));
        assertEq(decreaseSuccess, true);

        uint256 result = abi.decode(data, (uint256));
        assertEq(result, 5);
        assertEq(proxy.counter(), 5);
    }
}
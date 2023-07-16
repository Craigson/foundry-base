// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Base.sol";
import "../src/BaseUpgradeable.sol";

contract MockBase is Base {
 constructor() Base() {}
}

contract MockBaseUpgradeable is BaseUpgradeable {
 function initialize() public initializer {
  __BaseUpgradeable_init();
 }
}
contract BaseTest is Test {

  MockBase mockBase;
  MockBaseUpgradeable mockBaseUpgradeable;
 function setUp() public {
   mockBase = new MockBase();
   mockBaseUpgradeable = new MockBaseUpgradeable();
   mockBaseUpgradeable.initialize();
 }

 function testBase(uint256 count) public {
  count = bound(count, 10,100);

  for(uint256 i = 0; i < count; i++) {
    if (mockBase.baseCounter() % 2 != 0) {
      assertTrue(mockBase.debaseMe());
      assertTrue(mockBaseUpgradeable.debaseMe());
    } else {
     assertFalse(mockBase.debaseMe());
     assertFalse(mockBaseUpgradeable.debaseMe());
    }
  }
 }
}
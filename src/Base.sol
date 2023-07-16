// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import {ERC165} from "@openzeppelin/contracts/utils/introspection/ERC165.sol";
import {IBase} from "./IBase.sol";

abstract contract Base is IBase, ERC165 {

  uint256 public baseCounter;
  constructor() {}

  function debaseMe() public returns (bool) {
   baseCounter++;
   return baseCounter % 2 == 0;
  }

  function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
    return interfaceId == type(IBase).interfaceId || super.supportsInterface(interfaceId);
  }
}

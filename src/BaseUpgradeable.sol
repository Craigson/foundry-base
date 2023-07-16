// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import {ERC165CheckerUpgradeable} from "@openzeppelin/contracts-upgradeable/utils/introspection/ERC165CheckerUpgradeable.sol";
import {ERC165Upgradeable} from "@openzeppelin/contracts-upgradeable/utils/introspection/ERC165Upgradeable.sol";
import {IBase} from "./IBase.sol";

abstract contract BaseUpgradeable is IBase, ERC165Upgradeable {


  uint256 public baseCounter;
  function __BaseUpgradeable_init() internal {
   __ERC165_init();
  }
  function debaseMe() public returns (bool) {
   baseCounter++;
   return baseCounter % 2 == 0;
  }

  function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
    return interfaceId == type(IBase).interfaceId || super.supportsInterface(interfaceId);
  }

}

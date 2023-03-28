// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";

contract MyERC20V1 is ERC20Upgradeable {
    function initialize() external initializer {
        __ERC20_init("Yue", "YUE");
        _mint(msg.sender, 100000e18);
    }
}

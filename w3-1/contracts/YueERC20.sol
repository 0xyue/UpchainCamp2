// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "../node_modules/solmate/src/tokens/ERC20.sol";
import "../node_modules/solmate/src/auth/Owned.sol";

contract YueERC20 is ERC20, Owned {
    using Address for address;

    constructor() ERC20("YUE", "YUE", 18) Owned(msg.sender) {
        _mint(msg.sender, 10000 * 10 ** 18);
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function transferWithCallback(
        address recipient,
        uint256 amount
    ) external returns (bool) {
        transfer(recipient, amount);

        if (recipient.isContract()) {
            bool rv = TokenRecipient(recipient).tokensReceived(
                msg.sender,
                amount
            );
            require(rv, "No tokensReceived");
        }
        return true;
    }
}

interface TokenRecipient {
    function tokensReceived(
        address sender,
        uint amount
    ) external returns (bool);
}

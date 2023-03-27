// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "../node_modules/solmate/src/tokens/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract YueVault {
    mapping(address => uint) public deposited;
    address private immutable token;

    event Deposit(address indexed user, uint amount);
    event Withdraw(address indexed user, uint amount);

    constructor(address token_) {
        token = token_;
    }

    // 使用SafeERC20的safeTransferFrom来deposit
    function deposit(address user, uint amount) public {
        SafeERC20.safeTransferFrom(
            IERC20(token),
            msg.sender,
            address(this),
            amount
        );

        deposited[user] += amount;
        emit Deposit(user, amount);
    }

    // 以签名的⽅式 deposite,使用SafeERC20的safePermit
    function permitDeposit(
        address user,
        uint amount,
        uint deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external {
        ERC20(token).permit(
            msg.sender,
            address(this),
            amount,
            deadline,
            v,
            r,
            s
        );
        deposit(user, amount);
    }

    // 取款
    function withdraw(uint amount) public {
        uint currentDeposited = deposited[msg.sender];
        require(amount <= currentDeposited, "Invalid amount");
        deposited[msg.sender] -= amount;
        SafeERC20.safeTransferFrom(
            IERC20(token),
            address(this),
            msg.sender,
            amount
        );
        emit Withdraw(msg.sender, amount);
    }

    // 收款时被回调
    function tokensReceived(
        address sender,
        uint amount
    ) external returns (bool) {
        require(msg.sender == token, "invalid");
        deposited[sender] += amount;
        emit Deposit(msg.sender, amount);
        return true;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Bank {
    mapping(address => uint256) private balances;
    uint256 private maxWithdrawalAmount = 10 ether;

    event Deposit(address indexed account, uint256 amount);
    event Withdrawal(address indexed account, uint256 amount);

    function deposit() public payable {
        require(msg.value > 0, "Amount must be greater than zero");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) public {
        require(amount > 0, "Amount must be greater than zero");
        require(amount <= balances[msg.sender], "Insufficient balance");
        require(amount <= maxWithdrawalAmount, "Withdrawal amount exceeds maximum");
        balances[msg.sender] -= amount;
        bool success = payable(msg.sender).send(amount);
        require(success, "Withdrawal failed");
        emit Withdrawal(msg.sender, amount);
    }

    function getBalance(address account) public view returns (uint256) {
        return balances[account];
    }
}


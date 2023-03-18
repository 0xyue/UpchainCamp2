// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "./Score.sol";

contract Teacher{

    function callSetScore(IScore scoreContract, address student, uint256 score) external {
        scoreContract.setScore(student, score);
    }


}
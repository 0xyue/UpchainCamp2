// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.10;

contract Counter{

    uint public counter = 0;

    function add(uint x) public returns(uint){
        counter = counter + x;
        return counter;
    }

   
}
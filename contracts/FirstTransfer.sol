// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract FirstApproach{
    address lastPerson;
    uint balance;

    receive() external payable {
        lastPerson = msg.sender;
        balance = balance+msg.value;
    }

    function getLastPerson() public view returns(address){
        return lastPerson;
    }

    function getBalance() public view returns (uint){
        return balance;
    }
}
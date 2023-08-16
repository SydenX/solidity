// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract FirstApproach{

    struct wallet {
        uint balance;
        uint timesSent;
        uint totalSent;
    }

    mapping(address => wallet) Wallets;

    function getBalance() public view returns(uint){
        return Wallets[msg.sender].balance;
    }

    function getTimesSent() public view returns(uint){
        return Wallets[msg.sender].timesSent;
    }

    function getTotalSent() public view returns(uint){
        return Wallets[msg.sender].totalSent;
    }

    receive() external payable {
        Wallets[msg.sender].balance += msg.value;
        Wallets[msg.sender].timesSent += 1;
        Wallets[msg.sender].totalSent += msg.value;
    }

    function withdraw(address payable _to, uint _amount) public {
        if(Wallets[msg.sender].balance >= _amount){
            Wallets[msg.sender].balance-=_amount;
            _to.transfer(_amount);
        }
    }

    function getTotalBalance() public view returns (uint){
        return address(this).balance;
    }
}
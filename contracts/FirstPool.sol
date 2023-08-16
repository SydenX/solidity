// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract FirstPool is Ownable, Pausable{

    function pause() public onlyOwner{ _pause(); }
    function unpause() public onlyOwner{ _unpause(); }

    struct wallet {
        uint balance;
        uint timesSent;
        uint totalSent;
        uint totalWithdraw;
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

    function getTotalWithdraw() public view returns(uint){
        return Wallets[msg.sender].totalWithdraw;
    }

    receive() external payable {
        Wallets[msg.sender].balance += msg.value;
        Wallets[msg.sender].timesSent += 1;
        Wallets[msg.sender].totalSent += msg.value;
    }
    
    function withdraw(uint _amount) public payable {
        if(Wallets[msg.sender].balance >= _amount){
            Wallets[msg.sender].balance-=_amount;
            Wallets[msg.sender].totalWithdraw+=_amount;
            payable(msg.sender).transfer(_amount);
        }
    }

    function withdrawAll() public payable {
        withdraw(Wallets[msg.sender].balance);
    }

    function getGlobalBalance() public view returns (uint){
        return address(this).balance;
    }
}
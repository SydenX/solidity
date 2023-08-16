// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract FirstApproach{
    uint number;
    address myAddress;
    string aString;

    function getString() public view returns(string memory){
        return aString;
    }

    function setString(string memory _newString) public {
        aString = _newString;
    }

    function getNumber() public view returns(uint){
        return number;
    }

    function setNumber(uint _number) public {
        number = _number;
    }

    function getAddress() public view returns(address){
        return myAddress;
    }

    function setAddress(address _address) public {
        myAddress = _address;
    }
}

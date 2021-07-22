// SPDX-License-Identifier: MIT
pragma solidity >=4.0.22 <0.8.0;

contract PiggyBank {
    uint public goal;
    constructor (uint _goal) {
        goal = _goal;
    }

    receive() external payalbe {} // for receiving ether from EOA
    
    function getMyBalance() public view returns(uint) {
        return address(this).balace; // return the balance of the contract
    }

    function withdraw() public {
        if(getMyBalance() >= goal) {
            selfdestruct(msg.sender) // suicide and send ether to the user who calls
        }
    }

}
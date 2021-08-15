pragma solidity 0.8.4;

contract Ownable {
    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner, "owner can do this.");
        _;
    }

    constructor() {
        owner = msg.sender;
    }
}

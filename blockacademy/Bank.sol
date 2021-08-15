pragma solidity 0.8.4;

import "./modi.sol";

contract Bank is Ownable {
    mapping(address => uint256) balance;

    modifier balanceCheck(uint256 _amount) {
        require(balance[msg.sender] >= _amount, "insufficient amount");
        _;
    }

    function deposit() public payable onlyOwner {
        balance[msg.sender] += msg.value;
    }

    function getBalance(address _addr) public view returns (uint256) {
        return balance[_addr];
    }

    function withdraw(uint256 _amount) public balanceCheck(_amount) {
        uint256 beforeWithdraw = balance[msg.sender];
        balance[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount); // "transfer" is not recommended nowadays. "call" function is recommended for some reasons.
        uint256 afterWithdraw = balance[msg.sender];
        assert(afterWithdraw == beforeWithdraw - _amount); // Assert being called is abnormal. assert will not give back the gas you paid.
    }

    function transfer(address _to, uint256 _amount)
        public
        onlyOwner
        balanceCheck(_amount)
    {
        require(msg.sender != _to, "invalid recipient"); // check not himself
        _transfer(msg.sender, _to, _amount);
    }

    function _transfer(
        address _from,
        address _to,
        uint256 _amount
    ) private {
        balance[_from] -= _amount;
        balance[_to] += _amount;
    }
}

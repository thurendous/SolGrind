pragma solidity 0.8.4;

contract SimpleBank {
    function deposit() public payable {
        // by this we can deposit ether into it
    }

    function withdraw() public {
        // we need to add "payable" keyword
        payable(msg.sender).transfer(address(this).balance); // withdraw all the ether
        // send all of the ether of the contract balance to msg.sender
    }
}

contract Bank {
    mapping(address => uint256) balance;

    function deposit() public payable {
        balance[msg.sender] += msg.value;
    }

    function getBalance(address _addr) public view returns (uint256) {
        return balance[_addr];
    }

    function withdraw(uint256 _amount) public {
        require(
            getBalance(msg.sender) >= _amount,
            "no enough balance to withdraw"
        ); // Require being called is normal. and it will return the gas remained
        uint256 beforeWithdraw = balance[msg.sender];
        balance[msg.sender] -= _amount + 1;
        payable(msg.sender).transfer(_amount); // "transfer" is not recommended nowadays. "call" function is recommended for some reasons.
        uint256 afterWithdraw = balance[msg.sender];
        assert(afterWithdraw == beforeWithdraw - _amount); // Assert being called is abnormal. assert will not give back the gas you paid.
    }

    function transfer(address _to, uint256 _amount) public {
        require(getBalance(msg.sender) >= _amount, "no enough balance to send"); // check if the amount is available for him to send.
        require(msg.sender != _to, "invalid recipient"); // check not himself
        balance[msg.sender] -= _amount;
        balance[_to] += _amount;
    }
}

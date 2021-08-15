contract Bank {
    mapping(address => uint256) balance;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    function getBalance(address _addr) public view returns (uint256) {
        return balance[_addr];
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "owner can do this.");
        _;
    }

    modifier balanceCheck(uint256 _amount) {
        require(balance[msg.sender] >= _amount, "insufficient amount");
        _;
    }

    function deposit() public payable onlyOwner {
        balance[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) public balanceCheck(_amount) {
        uint256 beforeWithdraw = balance[msg.sender];
        balance[msg.sender] -= _amount + 1;
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
        balance[msg.sender] -= _amount;
        balance[_to] += _amount;
    }
}

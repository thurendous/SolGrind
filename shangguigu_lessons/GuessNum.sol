pragma solidity >0.4.23;

contract HoneyPot {
    // honeypot contract is a sacm on Ethereum blockchain. if you meet this contract do not use it. Scams are too good to be real.
    uint256 luckyNum = 52;
    uint256 public last;
    struct Guess {
        address player;
        uint256 number;
    }

    Guess[] public guessHistory;
    address owner = msg.sender;

    function guess(uint256 _num) public payable {
        Guess memory newGuess; // 这里如果没有memory的话就会出现大问题。就会指向我们整个存储空间的最初的那个地方，那么就是luckyNum了
        newGuess.player = msg.sender; // 这里把我们的newGuess的信息写上的时候其实就覆盖了我么得luckynnum的内容了。和不好的例子。
        newGuess.number = _num;
        guessHistory.push(newGuess);
        if (_num == luckyNum) msg.sender.transfer(msg.value * 2);
        last = now;
    }
}

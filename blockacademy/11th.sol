pragma solidity ^0.8.4;

contract A {
    string public msgA = "HelloWorld";

    constructor(_msg) {
        msgA = _msg;
    }

    function print() public view virtual returns (string memory) {
        return msgA;
    }

    function helloA() public pure returns (string memory) {
        return "Hello A";
    }
}

contract B {
    string public msgB = "HELLO WORLD";

    constructor(_msg) {
        msgB = _msg;
    }

    function print() public view virtual returns (string memory) {
        return msgB;
    }
}

contract C is B, A {
    function print() public view override(A, B) returns (string memory) {
        return super.print();
    }

    function changemsgB(string memory _msg) public {
        msgB = _msg;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ~0.7.1;

contract StudentScore {
    mapping(string => uint256) scores;
    string[] public names; // use this string array to save the info about the keys. or not we cannot know about the mapping info

    function addScore(string memory name, uint256 score) public {
        scores[name] = score;
    }

    function getScore(string memory name) public returns (uint256 score) {
        score = scores[name];
        names.push(name);
    }

    function clearScores() public returns (bool) {
        while (names.length > 0) {
            delete scores[names[names.length - 1]];
            names.pop();
        }
        return true;
    }
}

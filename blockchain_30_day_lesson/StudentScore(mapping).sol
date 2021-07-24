// SPDX-Licence-Identifier: MIT

pragma solidity ^0.7.0;

contract school {
    struct Class {
        string teacher;
        mapping(string => uint256) scores;
    }

    mapping(string => Class) classes; // class name => Class struct

    function addClass(string calldata className, string calldata teacher)
        public
    {
        // classes[className] = Class[teacher];  -> this is the wrong way.
        Class storage class = classes[className]; // struct is like a class you need to instantiate it.
        class.teacher = teacher;
    }

    function addStudentScore(
        string calldata className,
        string calldata studentName,
        uint256 score
    ) public {
        // (classes[calssName]).scores[studentName] = score; same as below

        Class storage class = classes[className]; // create a reference data
        class.scores[studentName] = score;
    }

    function getStudentScore(
        string calldata className,
        string calldata studentName
    ) public view returns (uint256 score) {
        // return (classes[className]).scores[studentName]; same as below

        Class storage class = classes[className]; // create a reference data
        return class.scores[studentName];
    }
}

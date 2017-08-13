pragma solidity ^0.4.0;

contract demo {
    string public name = "matt";

    function changeName(string newName) {
        name = newName;
    }
}

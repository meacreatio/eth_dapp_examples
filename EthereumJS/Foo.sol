pragma solidity ^0.4.11;

contract Foo {
    bytes32 foo;
    
    function setFoo(bytes32 _foo) {
        foo = _foo;
    }
    
    function getFoo() constant returns (bytes32) {
        return foo;
    }
}
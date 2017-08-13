pragma solidity ^0.4.0;

contract Foo {
    // create instance of contract you want to communicate with
    Calculator calculator = new Calculator();
    
    function twoTimesThree() constant returns (int) {
        return calculator.multiply(2, 3);
    }
}

contract Foo2 {
    // alernatively, reference the contract directly via its address
    Calculator calculator = Calculator(0xcbbe6ec46746218a5bed5b336ab86a0a22804d39);
    
    function threeTimesThree() constant returns (int) {
        return calculator.multiply(3, 3);
    }
}

contract Calculator {
    function add(int a, int b) returns (int) {
        return a + b;
    }
    
    function multiply(int a, int b) returns (int) {
        return a * b;
    }
}
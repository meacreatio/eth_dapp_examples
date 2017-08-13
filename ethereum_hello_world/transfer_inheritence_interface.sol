pragma solidity ^0.4.0;

contract FuncConcert {
    address owner;
    uint public tickets;
    uint constant price = 1 ether;
    mapping (address => uint) public purchasers;
    
    function FuncConcert(uint t) {
        owner = msg.sender;
        tickets = t;
    }
    
    function () payable {
        buyTickets(1);
    }
    
    function buyTickets(uint amount) payable {
        require(msg.value == (amount * price) && amount <= tickets && tickets != 0);
        purchasers[msg.sender] += amount;
        tickets -= amount;
        
        if (tickets == 0) {
            selfdestruct(owner);
        }
    }
    
    function website() returns (string);
}

interface Refundable {
    function refund(uint numTickets) returns (bool);
}

contract FuncAttack is FuncConcert(10), Refundable {
    
    function refund(uint numTickets) returns (bool) {
        if (purchasers[msg.sender] < numTickets) {
            return false;
        }
        
        msg.sender.transfer(numTickets * price);
        purchasers[msg.sender] -= numTickets;
        tickets += numTickets;
        return true;
    }
    
    function website() returns (string) {
        return "http:www.google.com";
    }
}
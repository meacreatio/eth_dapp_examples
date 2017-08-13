pragma solidity ^0.4.0;

library Groups {
    struct Group {
        mapping(address => bool) members;
    }
    
    function addMember(Group storage self, address addr) returns (bool) {
        if (self.members[addr]) {
            return false;
        }
        self.members[addr] = true;
        return true;
    }
    
    function delMember(Group storage self, address addr) returns (bool) {
        if (!self.members[addr]) {
            return false;
        }
        self.members[addr] = false;
        return true;
    }
}

import 'browser/Groups.sol';

contract UseLibrary {
    Groups.Group admins;
    
    function UseLibrary() {
        Groups.addMember(admins, msg.sender);
    }
    
    event Success();
    
    modifier onlyAdmins() {
        require(admins.members[msg.sender]);
        _;
    }
    
    function add(address addr) onlyAdmins {
        if (Groups.addMember(admins, addr)) {
            Success();
        }
    }
    
    function remove(address addr) onlyAdmins {
        if (Groups.delMember(admins, addr)) {
            Success();
        }
    }
}
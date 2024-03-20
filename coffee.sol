// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract coffee {
    struct Memo {
        string name;
        string message;
        uint timestamp;
        address from;
    } // struct used to group variables together

    Memo[] memos; // dynamic array
    address payable owner; //owner gng to receive

    constructor() {
        owner = payable(msg.sender);
    }

    function buyCoffee(string calldata name, string calldata message) external payable {
        require(msg.value > 0, "Pay more than 0 ethers");
        owner.transfer(msg.value);
        memos.push(Memo(name, message, block.timestamp, msg.sender));
    } 

    function getMemos() public view returns(Memo[] memory) {
        return memos;
    }
}
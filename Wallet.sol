// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract Wallet {
    address public owner;
    mapping (address => uint) public paymants;

    constructor() {
        owner = msg.sender;
    }

    function payForItem() public payable {
        paymants[msg.sender] = msg.value;
    }

    function withdrawAll() public payable {
        address payable _to = payable (owner);
        address _thisContract = address(this);
        _to.transfer(_thisContract.balance);

    }
}

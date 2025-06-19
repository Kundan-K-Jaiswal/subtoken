// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract SubToken {
    uint256 public feePerMonth = 0.01 ether;
    mapping(address => uint256) public subscriptionExpiry;

    function subscribe(uint256 months) public payable {
        require(msg.value == months * feePerMonth, "Incorrect payment");
        if (block.timestamp > subscriptionExpiry[msg.sender]) {
            subscriptionExpiry[msg.sender] = block.timestamp + (months * 30 days);
        } else {
            subscriptionExpiry[msg.sender] += (months * 30 days);
        }
    }

    function isSubscribed(address user) public view returns (bool) {
        return subscriptionExpiry[user] > block.timestamp;
    }

    function getExpiry(address user) public view returns (uint256) {
        return subscriptionExpiry[user];
    }
}

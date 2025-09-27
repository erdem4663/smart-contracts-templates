
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    mapping(uint => Candidate) public candidates;
    uint public candidatesCount;

    mapping(address => bool) public voters;

    constructor() {
        addCandidate("Alice");
        addCandidate("Bob");
    }

    function addCandidate(string memory _name) private {
        candidates[candidatesCount] = Candidate(_name, 0);
        candidatesCount++;
    }

    function vote(uint _candidateId) public {
        require(!voters[msg.sender], "Already voted");
        require(_candidateId < candidatesCount, "Invalid candidate");
        voters[msg.sender] = true;
        candidates[_candidateId].voteCount++;
    }
}

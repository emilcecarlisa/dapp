pragma solidity ^0.4.4;

/*
A Ballot presents options for voters to participate in regarding a specific Issue

The building blocks for a ballot are: 
- Interface
- Options
- Criteria
*/

contract Ballot {
	// This is the type for a single option shown in a ballot
	struct Option {
        bytes32 optionName; // short name (up to 32 bytes)
        uint voteCount; // number of accumulated votes
    }


    // A dynamically-sized array of `Option` structs.
    Option[] public proposals;


    // Create a new ballot that is populated with options
    function Ballot(bytes32[] proposalNames) {

    	// For each of the provided proposal names,
        // create a new proposal object and add it
        // to the end of the array.
        for (uint i = 0; i < proposalNames.length; i++) {
            // WIP 
            // `Proposal({...})` creates a temporary
            // Proposal object and `proposals.push(...)`
            // appends it to the end of `proposals`.
            proposals.push(Option({
                optionName: proposalNames[i],
                voteCount: 0
            }));
        }
    }

    function getProposalsLength() public constant returns(uint length) {
        return proposals.length;
    }

    function receiveVote(uint proposalOption) public returns (bool successful) {
        proposals[proposalOption].voteCount += 1;
        return true;
    }
}

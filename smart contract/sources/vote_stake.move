module liveto::vote_stake {

    use sui::object::{Self, ID};
    use sui::tx_context::TxContext;
    use sui::coin::{Self, Coin};
    use sui::balance::Balance;
    use sui::vector;
    
    // Struct to store a voting event
    struct VotingEvent has key, store {
        id: ID,
        creator: address,
        votes: vector<Vote>,
        total_staked: u64,
    }

    // Struct to store a single vote
    struct Vote has store {
        voter: address,
        amount: u64,  // Staked token amount
    }

    // Initialize a new voting event
    public entry fun create_voting_event(
        creator: &signer,
        ctx: &mut TxContext
    ): VotingEvent {
        VotingEvent {
            id: object::new(ctx),
            creator: signer::address_of(creator),
            votes: vector::empty<Vote>(),
            total_staked: 0,
        }
    }

    // Function for users to vote by staking tokens
    public entry fun vote(
        event: &mut VotingEvent,
        voter: &signer,
        stake: Coin<u64>
    ) {
        let amount = coin::value(&stake);
        coin::destroy_zero(stake); // Burn token from sender

        let new_vote = Vote {
            voter: signer::address_of(voter),
            amount,
        };

        vector::push_back(&mut event.votes, new_vote);
        event.total_staked = event.total_staked + amount;
    }

    // Function to check total votes and stake amount
    public fun get_total_staked(event: &VotingEvent): u64 {
        event.total_staked
    }

    // Function to get votes count
    public fun get_vote_count(event: &VotingEvent): u64 {
        vector::length(&event.votes)
    }
}
module liveto::vote_stake_test {

    use sui::object::{Self, ID};
    use sui::tx_context::TxContext;
    use sui::coin::{Self, Coin};
    use sui::balance::Balance;
    use sui::vector;
    use sui::test_scenario;
    
    use liveto::vote_stake;

    /// Test creating a voting event
    public fun test_create_voting_event() {
        let ctx = test_scenario::new_tx_context();
        let creator = test_scenario::new_signer();
        
        let event = vote_stake::create_voting_event(&creator, &mut ctx);
        
        assert!(event.total_staked == 0, 0);
        assert!(vector::length(&event.votes) == 0, 1);
    }

    /// Test voting with staking
    public fun test_vote() {
        let ctx = test_scenario::new_tx_context();
        let creator = test_scenario::new_signer();
        let voter = test_scenario::new_signer();
        
        let mut event = vote_stake::create_voting_event(&creator, &mut ctx);
        
        // Simulating staking 100 tokens
        let stake = coin::mint(100);
        vote_stake::vote(&mut event, &voter, stake);

        assert!(event.total_staked == 100, 2);
        assert!(vector::length(&event.votes) == 1, 3);
    }

    /// Test multiple votes
    public fun test_multiple_votes() {
        let ctx = test_scenario::new_tx_context();
        let creator = test_scenario::new_signer();
        let voter1 = test_scenario::new_signer();
        let voter2 = test_scenario::new_signer();
        
        let mut event = vote_stake::create_voting_event(&creator, &mut ctx);
        
        let stake1 = coin::mint(50);
        let stake2 = coin::mint(150);
        
        vote_stake::vote(&mut event, &voter1, stake1);
        vote_stake::vote(&mut event, &voter2, stake2);

        assert!(event.total_staked == 200, 4);
        assert!(vector::length(&event.votes) == 2, 5);
    }
}
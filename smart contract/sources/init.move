module liveto::init {

    use sui::object::{Self, ID};
    use sui::tx_context::TxContext;
    use sui::signer;
    use sui::balance::Balance;
    use sui::vector;
    use liveto::vote_stake;

    // Function to initialize the contract with a default voting event
    public entry fun init_contract(creator: &signer, ctx: &mut TxContext) {
        let event = vote_stake::create_voting_event(creator, ctx);
        // Initialization logic (if any) can be added here
    }
}
#[starknet::contract]
mod Balance_Counter {
    use starknet::{get_caller_address, ContractAddress};

    // this is the storage struct where all state variables can be set 
    #[storage]
    struct Storage {
        owner: ContractAddress,
        balance: u256,
        caller_balance: LegacyMap<ContractAddress, u256>
    }


    // like solidity, the constructor runs once and allows state variables to be set upon successful deployment of the contract
    #[constructor]
    fn constructor(ref self: ContractState, amount: u256) {
        let owner = get_caller_address();
        self.owner.write(owner);
        self.balance.write(amount);
    }

    // this function sets the state balance and can only be called by the owner 
    #[external(v0)]
    fn admin_set_balance(ref self: ContractState, amount: u256) {
        let caller = get_caller_address();
        let owner = self.owner.read();
        assert(caller == owner, 'only owner can set balance');
        self.balance.write(amount);
    }

    // this utility function allows the balance of the contract to be read
    #[external(v0)]
    fn get_balance(self: @ContractState) -> u256 {
        self.balance.read()
    }

    // this function when called increases the balance of the caller
    #[external(v0)]
    fn set_caller_balance(ref self: ContractState, amount: u256) {
        let caller_address = get_caller_address();
        let current_caller_balance = self.caller_balance.read(caller_address);
        self.caller_balance.write(caller_address, current_caller_balance + amount);
    }

    // this utility function allows the balance of the caller to be read by passing address to the legacy map
    #[external(v0)]
    fn get_caller_balance(self: @ContractState) -> u256 {
        self.caller_balance.read(get_caller_address())
    }
}

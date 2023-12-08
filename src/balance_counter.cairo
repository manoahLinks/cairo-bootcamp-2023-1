#[starknet::contract]

mod Balance_Counter {
    #[storage]
    struct Storage {
        balance: u256
    }

    // #[constructor]
    // fn constructor(ref self: ContractState) {}
    #[external(v0)]
    fn set_balance(ref self: ContractState, amount: u256) {
        self.balance.write(amount);
    }

}

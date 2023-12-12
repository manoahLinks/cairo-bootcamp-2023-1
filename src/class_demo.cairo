#[starknet::contract]
mod Class_Demo {
    use starknet::{get_caller_address, ContractAddress};

    #[derive(Drop, Serde, starknet::Store)]
    struct Student_struct {
        name: felt252,
        age: u8,
        is_active: bool,
        has_reward: bool,
        reward_balance: u8,
    }

    #[storage]
    struct Storage {
        student_map: LegacyMap<ContractAddress, Student_struct>
    }

    // this function saves data to a LegacyMap given an address and a student_struct instance 
    #[external(v0)]
    fn set_stru_data(
        ref self: ContractState,
        _name: felt252,
        _age: u8,
        _is_active: bool,
        _has_reward: bool,
        _reward_balance: u8,
        _is_owing: bool
    ) {
        let caller = get_caller_address();

        let mut student = Student_struct {
            name: _name,
            age: _age,
            is_active: _is_active,
            has_reward: _has_reward,
            reward_balance: _reward_balance
        };

        self.student_map.write(caller, student);
    }

    // this function reads data from a LegacyMap in storage called student_map when passed an address as key
    #[external(v0)]
    fn get_struct_data(self: @ContractState) -> Student_struct {
        let caller = get_caller_address();
        self.student_map.read(caller)
    }
}

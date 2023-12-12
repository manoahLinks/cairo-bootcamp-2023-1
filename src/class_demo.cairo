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
        is_owing: bool,
    }

    #[storage]
    struct Storage {
        name: felt252,
        w_address: ContractAddress,
        age: u8,
        is_active: bool,
        has_reward: bool,
        reward_balance: u256,
        is_owing: bool,
        student_map: LegacyMap<ContractAddress, Student_struct>
    }

    #[external(v0)]
    fn set_class_character(
        ref self: ContractState,
        _name: felt252,
        _w_address: ContractAddress,
        _age: u8,
        _is_active: bool,
        _has_reward: bool,
        _reward_balance: u256,
        _is_owing: bool
    ) {
        self.name.write(_name);
        self.w_address.write(_w_address);
        self.age.write(_age);
        self.is_active.write(_is_active);
        self.has_reward.write(_has_reward);
        self.reward_balance.write(_reward_balance);
        self.is_owing.write(_is_owing);
    }

    #[external(v0)]
    fn get_name(self: @ContractState) -> felt252 {
        self.name.read()
    }

    // this function saves data to a LegacyMap given an address and a student_struct instance 
    #[external(v0)]
    fn set_struct_data (ref self: ContractState, _name: felt252, _age: u8, _is_active: bool, _has_reward: bool, _reward_balance: u8, _is_owing: bool) {
        
        let caller = get_caller_address();

        let mut student = Student_struct{name: _name, age: _age, is_active: _is_active, has_reward: _has_reward, reward_balance: _reward_balance, is_owing: _is_owing};
    
        self.student_map.write(caller, student);
    }

    #[external(v0)]
    fn get_struct_data (self: @ContractState) -> Student_struct {
        let caller = get_caller_address();
        self.student_map.read(caller)
    }
}

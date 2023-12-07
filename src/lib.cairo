use debug::PrintTrait;
mod gm_cairo;
mod intro_to_felt;
mod calculations;

// main function is the entry point to any program
// this is the mother function - meaning other functions are housed in this function such that when `scarb cairo-run` command is run, the logic in other functions are automatically run at the same time
// by having multiple functions, we separate concerns so we can handle multiple logics independently
fn main() {
    gm_cairo::gm_cairo();
    intro_to_felt::intro_to_felt();
    let result = calculations::add(30, 10);
    let result_to_felt: felt252 = result.into();
    result_to_felt.print();
}


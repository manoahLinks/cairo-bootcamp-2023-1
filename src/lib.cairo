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
    calculations::add(10, 15);
    calculations::sub(200, 50);
    calculations::mutiply(50, 5);
    calculations::div(50, 5);
    calculations::check_even(20, 5);
}

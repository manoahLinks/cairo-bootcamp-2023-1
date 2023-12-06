use debug::PrintTrait;

// main function is the entry point to any program
// this is the mother function - meaning other functions are housed in this function such that when `scarb cairo-run` command is run, the logic in other functions are automatically run at the same time
// by having multiple functions, we separate concerns so we can handle multiple logics independently
fn main()  {
    gm_cairo();
    intro_to_felt();
}

// this function prints "GM_CAIRO" just like "Hello world"
fn gm_cairo() {
    'GM_CAIRO'.print();
}

// this function showcases how Cairo implicitly assigns felt252 as its default data types to variables
fn intro_to_felt() {
    let felt_1 = 'Chris';
    felt_1.print();

    let felt_2 = true;
    felt_2.print();

    let felt_3 = '30';
    felt_3.print();
}




#[cfg(test)]
mod tests {
    // use super::fib;

    #[test]
    #[available_gas(100000)]
    fn it_works() {
        // assert(fib(16) == 987, 'it works!');
    }
}

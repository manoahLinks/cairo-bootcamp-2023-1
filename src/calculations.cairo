use debug::PrintTrait;

// this function sums 2 integer values and returns the result
fn add(num_1: u32, num_2: u32) -> u32 {
    let result: u32 = num_1 + num_2;
    result.print();
    result
}

// this function subtracts an integer value and returns the result
fn subract(num_1: u32, num_2: u32) -> u32 {
    let result: u32 = num_1 - num_2;
    result.print();
    result
}
use debug::PrintTrait;

fn add(num_1: u32, num_2: u32) -> u32 {
    let result: u32 = num_1 + num_2;
    result.print();
    result
}

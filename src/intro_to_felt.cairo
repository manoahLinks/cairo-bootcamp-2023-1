use debug::PrintTrait;

// this function showcases how Cairo implicitly assigns felt252 as its default data types to variables
fn intro_to_felt() {
    let felt_1 = 'Chris';
    felt_1.print();

    let felt_2 = true;
    felt_2.print();

    let felt_3 = '30';
    felt_3.print();
}

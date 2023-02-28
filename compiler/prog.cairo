fn main() {
    let x: felt = 10;
    if x < 10 {
        debug::print_felt('x is felt than 10');
    } else {
        let mut data = array_new();
        array_append(ref data, 'Not less than 10');
        panic(data)
    }
}
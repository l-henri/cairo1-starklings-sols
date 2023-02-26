// primitive_types1.cairo
// Fill in the rest of the line that has code missing!
// No hints, there's no tricks, just get used to typing these :)

fn main() {
    // Booleans (`bool`)

    let is_morning: bool= true;
    if is_morning {
        debug::print_felt('Good morning!');
    }

    let is_evening: bool = false;
    if is_evening {
        debug::print_felt('Good evening!');
    }
}

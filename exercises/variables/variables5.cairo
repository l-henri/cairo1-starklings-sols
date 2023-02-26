// variables5.cairo
// Execute `starklings hint variables5` or use the `hint` watch subcommand for a hint.
// Use shadowing of variables to print the same value twice.

use traits::Into;

fn main() {
    let number: u8 = 1_u8; // don't change this line
    debug::print_felt(number.into());
    let number: felt = 3; // don't rename this variable
    debug::print_felt(number);
}

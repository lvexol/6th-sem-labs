use std::io;

fn main() {
    let mut input = String::new();
    println!("Enter a number:");

    io::stdin().read_line(&mut input).expect("Failed to read input");
    let number: i32 = input.trim().parse().expect("Please enter a valid integer");

    if number > 0 {
        println!("The number is Positive.");
    } else if number < 0 {
        println!("The number is Negative.");
    } else {
        println!("The number is Zero.");
    }
}


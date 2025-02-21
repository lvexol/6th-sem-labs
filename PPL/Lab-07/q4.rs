use std::io;

fn main() {
    let mut input = String::new();
    println!("Enter an integer:");

    io::stdin().read_line(&mut input).expect("Failed to read input");
    let number: i32 = input.trim().parse().expect("Please enter a valid integer");

    if number % 2 == 0 {
        println!("Even");
    } else {
        println!("Odd");
    }
}


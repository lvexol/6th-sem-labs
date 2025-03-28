//Text processing

use std::io;

fn main() {
    // Prompt user for input
    println!("Please enter a sentence:");

    // Read user input
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim whitespace and extract the word "Rust"
    let word_to_extract = "Rust";
    if let Some(extracted_word) = extract_word(&input.trim(), word_to_extract) {
        println!("Extracted word: {}", extracted_word);
        
        // Modify the original string
        let modified_string = modify_string(&input.trim(), extracted_word);
        println!("Modified string: {}", modified_string);
    } else {
        println!("The word '{}' was not found in the input.", word_to_extract);
    }
}

// Function to extract a specific word from the input string
fn extract_word<'a>(input: &'a str, word: &'a str) -> Option<&'a str> {
    if input.contains(word) {
        let start = input.find(word).unwrap();
        let end = start + word.len();
        return Some(&input[start..end]);
    }
    None
}

// Function to modify the original string by removing the extracted word
fn modify_string(input: &str, word: &str) -> String {
    input.replace(word, "").trim().to_string()
}




//Weather 

fn main() {
    let temperatures: [f32; 7] = [22.5, 23.0, 24.1, 25.0, 26.3, 27.4, 28.2];

    // Extract a slice for the last three days
    let last_three_days = &temperatures[4..7];

    // Calculate and print the average temperature of the last three days
    match calculate_average(last_three_days) {
        Some(average) => println!("Average temperature for the last 3 days: {:.2}°C", average),
        None => println!("Error: Unable to calculate the average temperature."),
    }

    // Demonstrate an attempt to access out-of-bounds slice
    // Uncommenting the next line will cause a runtime panic due to out-of-bounds access
    // let out_of_bounds = &temperatures[10..15];  // This will cause an error
    // println!("{:?}", out_of_bounds);  // This won't be executed because of the error
}

// Function to calculate the average of an array slice
fn calculate_average(temps: &[f32]) -> Option<f32> {
    if temps.is_empty() {
        return None;
    }

    let sum: f32 = temps.iter().sum();
    Some(sum / temps.len() as f32)
}


// Online Student Record System


// Define the Student struct with fields: name, age, and grade
#[derive(Debug)]
struct Student {
    name: String,
    age: u32,
    grade: String,  // Change grade type to String
}

impl Student {
    // Constructor to create a new Student
    fn new(name: &str, age: u32, grade: &str) -> Self {
        Student {
            name: name.to_string(),
            age,
            grade: grade.to_string(),  // Ensure grade is a String
        }
    }

    // Function to display student information (borrowed reference)
    fn display_student(student: &Student) {
        println!("Name: {}, Age: {}, Grade: {}", student.name, student.age, student.grade);
    }

    // Function to modify student's grade (mutable reference)
    fn update_grade(&mut self, new_grade: &str) {
        self.grade = new_grade.to_string();  // Convert the new_grade to String
    }
}

fn main() {
    // Create a Vec to store multiple Student records
    let mut students: Vec<Student> = Vec::new();

    // Add some students to the Vec
    students.push(Student::new("Alice", 20, "B"));
    students.push(Student::new("Bob", 22, "A"));
    students.push(Student::new("Charlie", 21, "C"));

    // Display all students (immutable borrowing)
    println!("Student records:");
    for student in &students {
        Student::display_student(student);
    }

    // Modify Bob's grade (mutable borrowing)
    if let Some(bob) = students.iter_mut().find(|s| s.name == "Bob") {
        bob.update_grade("A+");  // Now using a string literal
    }

    // Display updated records
    println!("\nUpdated student records:");
    for student in &students {
        Student::display_student(student);
    }
}
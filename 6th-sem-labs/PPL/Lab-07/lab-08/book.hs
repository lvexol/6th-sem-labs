#[derive(Clone)]
struct Book {
    title: String,
    is_issued: bool,
}

impl Book {
    fn new(title: &str) -> Self {
        Book {
            title: title.to_string(),
            is_issued: false,
        }
    }
    
    fn issue(self) -> Self {
        println!("Issuing: {}", self.title);
        Self { is_issued: true, ..self }
    }
    
    fn details(&self) {
        println!("Title: {}, Issued: {}", self.title, self.is_issued);
    }
}

fn main() {
    let book = Book::new("The Rust Book");
    let backup = book.clone();
    
    backup.details();
    let issued = book.issue();
    issued.details();
}

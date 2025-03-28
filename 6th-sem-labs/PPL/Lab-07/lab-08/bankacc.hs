struct BankAccount {
    account_number: String,
    owner_name: String,
    balance: f64,
}

impl BankAccount {
    fn new(account_number: &str, owner_name: &str, balance: f64) -> Self {
        BankAccount {
            account_number: account_number.to_string(),
            owner_name: owner_name.to_string(),
            balance,
        }
    }

    fn view_balance(&self) -> f64 {
        self.balance
    }

    fn deposit(&mut self, amount: f64) {
        if amount > 0.0 {
            self.balance += amount;
            println!("Deposited ${}. New balance: ${}", amount, self.balance);
        } else {
            println!("Deposit amount must be greater than zero.");
        }
    }

    fn withdraw(&mut self, amount: f64) {
        if amount > 0.0 && self.balance >= amount {
            self.balance -= amount;
            println!("Withdrew ${}. New balance: ${}", amount, self.balance);
        } else {
            println!("Insufficient funds or invalid withdrawal amount.");
        }
    }
}

fn main() {
    let mut account = BankAccount::new("123456", "Alice", 500.0);

    println!("Initial balance: ${}", account.view_balance());

    account.deposit(200.0);
    println!("Balance after deposit: ${}", account.view_balance());

    account.withdraw(150.0);
    println!("Balance after withdrawal: ${}", account.view_balance());
}
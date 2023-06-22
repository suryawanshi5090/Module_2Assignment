package modul_2_core_java;

import java.util.Scanner;

class insufficientFunds extends Exception{
	
	double amount;
	
	public insufficientFunds(double amount) {
		this.amount = amount;
	}
	
	public double getAmount() {
		return this.amount;
	}
	
}

class checkingAccount{
	
	long accNo;
	double balance = 0;
	
	public checkingAccount(long accNo) {
		this.accNo = accNo;
		System.out.println("\nYour Account No.: "+this.accNo);
	}
	
	public void deposit(double amount) {
		this.balance = this.balance + amount;
	}
	
	public void checkBalance() {
		System.out.println("Your Account Balance: Rs." +this.balance);
	}
	
	public void withdraw(double amount)throws insufficientFunds {
		if(amount <= this.balance) {
			this.balance = this.balance - amount;
		}
		else {
			double needs = amount - this.balance;
			throw new insufficientFunds(needs);
		}
	}
	
	
}


public class Question40 {
	public static void main(String[] args) {
		checkingAccount c1 = new checkingAccount(402099);
		c1.checkBalance();
		Scanner sc = new Scanner(System.in);
		System.out.println("\n\nEnter the amount to Deposit.");
		double amt = sc.nextDouble();
		c1.deposit(amt);
		c1.checkBalance();
		
		
		try {
			System.out.println("\n\nEnter the amount for Withdrawal");
			amt = sc.nextDouble();
			c1.withdraw(amt);
			System.out.println("\nSuccessful Withdrawal.");
		} catch (insufficientFunds e) {
			// TODO Auto-generated catch block
			System.out.println("Sorry You need Rs. "+e.getAmount()+"more for Withdrawal.");
			c1.checkBalance();
			System.out.println("\n\n****Thank You****");

		}
		
		
	}

}

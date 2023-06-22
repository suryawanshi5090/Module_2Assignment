package modul_2_core_java;

abstract class Bank{
	public abstract int getBalance();
}

class BankA extends Bank{
	private int balance = 100;
	
	public int getBalance() {
		return balance;
	}
}

class BankB extends Bank{
	private int balance = 150;
	
	public int getBalance() {
		return balance;
	}
}

class BankC extends Bank{
	private int balance = 200;
	
	public int getBalance() {
		return balance;
	}
}


public class Question30 {
	public static void main(String[] args) {
		BankA a = new BankA();
		BankB b = new BankB();
		BankC c = new BankC();
		
		System.out.println("Bank A balance:$ "+a.getBalance());
		System.out.println("Bank B balance:$ "+b.getBalance());
		System.out.println("Bank C balance:$ "+c.getBalance());
	}

}

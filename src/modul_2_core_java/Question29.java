package modul_2_core_java;

abstract class Parent {
	public abstract void message();
}

class FirstSubclass extends Parent {
	public void message() {
		System.out.println("This is first subclass");
	}
}

class SecondSubclass extends Parent{
	public void message() {
		System.out.println("This is second subclass");
	}
}

public class Question29 {
	public static void main(String[] args) {
		FirstSubclass f = new FirstSubclass();
		SecondSubclass s = new SecondSubclass();
		f.message();
		s.message();
		
	}

}

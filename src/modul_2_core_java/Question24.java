package modul_2_core_java;

class ParentClass{
	
	public void printmessage() {
		System.out.println("This is a Parent class");
	}
}
class ChildClass extends ParentClass{
	
	public void printMessage() {
		System.out.println("This is a child class");
	}
	
}
public class Question24 {
	public static void main(String[] args) {
		ChildClass c = new ChildClass();
		c.printmessage();
		c.printMessage();
		
	}

}

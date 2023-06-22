package modul_2_core_java;

class Member{
	private String name;
	private int age;
	private String phonNum;
	private String address;
	private double salary;
	
	Member(String name,int age,String phonNum,String address,double salary) {
		this.name = name;
		this.age = age;
		this.phonNum = phonNum;
		this.address = address;
		this.salary = salary;
		
	}
	
	public void printSalary() {
		System.out.println("Salary of " +name+" "+"is"+" " +salary);
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	public int getAge() {
		return age;
	}
	
	public void setPhonNum(String phonNum) {
		this.phonNum = phonNum;
	}
	
	public String getPhonNum() {
		return phonNum;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setSalary(double salary) {
		this.salary = salary;
	}
	
	
}
public class Question25 {
	public static void main(String[] args) {
		Member m1 = new Member("Keshree", 26, "ps524123","Nagpur" ,100000);
		m1.printSalary();
	}

}

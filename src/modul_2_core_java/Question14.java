package modul_2_core_java;

public class Question14 {
	public static void main(String[] args) {
		String str = "Tops Technologies!";
		System.out.println("Original String: "+str);
		
		int index1 = str.charAt(0);
		int index2 = str.charAt(10);
		
		System.out.println("The charactor at position 0 is: "+(char)index1);
		System.out.println("The charactor at position 10 is: "+(char)index2);
	}

}

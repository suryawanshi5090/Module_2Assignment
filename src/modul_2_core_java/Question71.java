package modul_2_core_java;

import java.util.ArrayList;
import java.util.Iterator;

public class Question71 {
	public static void main(String[] args) {
		ArrayList<String> a = new ArrayList<String>();
		a.add("Pramod");
		a.add("Aniket");
		a.add("Mayur");
		
		System.out.println("Original arraylist: " +a);
		
		a.set(1, "Tushar");
		System.out.println("When Replaced second element with 'Tushar': " +a);
		
		System.out.println("\nIterating through Iterator:");
		Iterator itr = a.iterator();
		
		while(itr.hasNext()) {
			System.out.println(itr.next()); 
		}
	}

}

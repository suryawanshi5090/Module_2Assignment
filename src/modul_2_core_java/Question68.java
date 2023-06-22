package modul_2_core_java;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

public class Question68 {
	public static void main(String[] args) {
		HashSet hs = new HashSet();
		hs.add("Pramod");
		hs.add("Aniket");
		hs.add("Mayur");
		hs.add("Tushar");
		hs.add("Kartik");
		
		System.out.println("Original Hashset: " +hs);
		
		List<String> lt = new ArrayList<String>(hs);
		System.out.println("Arraylist contains: " +lt);
		
	}

}

package modul_2_core_java;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class Question60 {
	public static void main(String[] args) {
		HashMap hm = new HashMap<>();
		hm.put(1,"Pramod");
		hm.put(2,"Aniket");
		hm.put(3,"Mayur");
		hm.put(4,"Tushar");
		hm.put(5,"Kartik");
		
		System.out.println("Original Hashset: " +hm);
		
		for(int i = 1;i <= 5;i++) {
			System.out.println(hm.get(i));
			
		}
		
        Set set = hm.entrySet();
		Iterator itr = set.iterator();
		
		while(itr.hasNext()) {
			System.out.println(itr.next());
		}
		
		
	}

}

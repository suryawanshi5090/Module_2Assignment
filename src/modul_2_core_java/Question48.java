package modul_2_core_java;

import java.util.ArrayList;

public class Question48 {
	public static void main(String[] args) {
		ArrayList n = new ArrayList();
		n.add(1);
		n.add(2);
		n.add(3);
		n.add(4);
		n.add(5);
		
		for(int i = 0;i < 5;i++) {
			System.out.println("Elements at index " +i+":" +n.get(i));
		}
	}

}

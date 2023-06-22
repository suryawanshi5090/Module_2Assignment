package modul_2_core_java;

public class Question9 {
	public static void main(String[] args) {
		String str = "Hello Charlie123&&";
		char ch[] = str.toCharArray();
		int letter = 0,space = 0,num = 0,other = 0;
		
		for(int i = 0;i < ch.length;i++) {
			if(Character.isLetter(ch[i])) {
				letter++;
			}
			else if(Character.isDigit(ch[i])) {
				num++;
			}
			else if (Character.isSpaceChar(ch[i])) {
				space++;
			}
			else {
				other++;
			} 
			System.out.println("letter: " +letter);	
			System.out.println("number: " +num);	
			System.out.println("space: " +space);	
			System.out.println("other: " +other);	
			
		}
			
		
	}

}

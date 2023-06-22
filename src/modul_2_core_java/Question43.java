package modul_2_core_java;



public class Question43 extends Thread{	
	
	public Question43() {
		super("Thread2");
		start();
		
	}
	
	public void run() {
		for(int i = 1;i <= 5;i++) {
			System.out.println(this +":" +i);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("Thread2 Executed.");
	}
	
	public static void main(String[] args) {
		new Question43();
	}

}

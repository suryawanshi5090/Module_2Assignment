package modul_2_core_java;

public class Question42 implements Runnable {
	Thread t;
	String tname;
	
	public Question42(String tname) {
		this.tname = tname;
		t = new Thread (this,tname);
		t.start();
	}
	
	@Override
	public void run() {
		for(int i = 1;i <= 5;i++) {
			System.out.println(t +":" +i);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("Thread1 Executed.");
		
	}
	
	
	public static void main(String[] args) {
		new Question42("1st");
		new Question42("2nd");

	}

	

}

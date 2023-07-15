package com.bean;

public class Phone {

	String pno;

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}
	
	public void call()
	{
		System.out.println("Calling.............."+pno);
	}
	
}

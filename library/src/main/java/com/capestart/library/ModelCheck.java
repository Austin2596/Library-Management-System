package com.capestart.library;

import java.util.LinkedList;
import java.util.List;

public class ModelCheck {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		List a1= new LinkedList();
		List a2= new LinkedList();
		
		a1.add(12);
		a2.add(13);
		a2.add(null);
		a2=new LinkedList();
		System.out.println(a1.get(0));
		

	}
	
	ModelCheck m1= new ModelCheck();
	ModelCheck m2= new ModelCheck();
	

}

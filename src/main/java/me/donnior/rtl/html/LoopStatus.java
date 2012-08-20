package me.donnior.rtl.html;

public class LoopStatus {

	private int index;

	public LoopStatus(int index){
		this.index = index;
	}

	public int getIndex(){
		return this.index;
	}

	public int getCount(){
		return this.index + 1;
	}
	
}

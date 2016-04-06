package com.leo.bean;

public class DataReturnInfo {
	private int id;
	private float startMoney;
	private float year;
	private float rate;
	private float sum;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public float getStartMoney() {
		return startMoney;
	}

	public void setStartMoney(float startMoney) {
		this.startMoney = startMoney;
	}

	public float getYear() {
		return year;
	}

	public void setYear(float year) {
		this.year = year;
	}

	public float getRate() {
		return rate;
	}

	public void setRate(float rate) {
		this.rate = rate;
	}

	public float getSum() {
		return sum;
	}

	public void setSum(float sum) {
		this.sum = sum;
	}
	
	
	public DataReturnInfo(int id,float startMoney,float year,float rate ,float sum)
	{
		super();
		this.id = id;
		this.startMoney = startMoney;
		this.year = year;
		this.sum = sum;

	}

}

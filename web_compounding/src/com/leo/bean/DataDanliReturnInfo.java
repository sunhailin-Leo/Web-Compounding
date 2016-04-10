package com.leo.bean;

public class DataDanliReturnInfo {
	private int id;
	private float startMoney;
	private int year;
	private double rate;
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

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public float getSum() {
		return sum;
	}

	public void setSum(float sum) {
		this.sum = sum;
	}
	public DataDanliReturnInfo(int id,float startMoney,int year,double rate ,float sum) {
		super();
		this.id = id;
		this.startMoney = startMoney;
		this.year = year;
		this.rate = rate;
		this.sum = sum;

	}
}

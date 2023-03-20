package com.bus.booking.dto;

import java.util.List;

public class Ticket {

	private int ticketId;
	private String busName;
	private String fromPlace;
	private String toPlace;
	private int seats;
	private double totalAmount;
	private String UserName;
	private int age;
	private String gender;

	public Ticket() {

	}

	public Ticket(int ticketId, String busName, String fromPlace, String toPlace, int seats, double totalAmount,
			String userName, int age, String gender) {
		super();
		this.ticketId = ticketId;
		this.busName = busName;
		this.fromPlace = fromPlace;
		this.toPlace = toPlace;
		this.seats = seats;
		this.totalAmount = totalAmount;
		this.UserName = userName;
		this.age = age;
		this.gender = gender;
	}

	public int getTicketId() {
		return ticketId;
	}

	public void setTicketId(int ticketId) {
		this.ticketId = ticketId;
	}

	public String getBusName() {
		return busName;
	}

	public void setBusName(String busName) {
		this.busName = busName;
	}

	public String getFromPlace() {
		return fromPlace;
	}

	public void setFromPlace(String fromPlace) {
		this.fromPlace = fromPlace;
	}

	public String getToPlace() {
		return toPlace;
	}

	public void setToPlace(String toPlace) {
		this.toPlace = toPlace;
	}

	public int getSeats() {
		return seats;
	}

	public void setSeats(int seats) {
		this.seats = seats;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

}

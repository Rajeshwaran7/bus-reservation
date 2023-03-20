package com.bus.booking.dto;

public class Bus {

	private int busId;
	private String name;
	private String from;
	private String to;
	private int seats;
	private double ticketRate;

	public Bus() {
		// TODO Auto-generated constructor stub
	}

	public Bus(int busId, String from, String to, int seats, String name, double ticketRate) {
		super();
		this.busId = busId;
		this.from = from;
		this.to = to;
		this.name = name;
		this.seats = seats;
		this.ticketRate = ticketRate;
	}

	public int getBusId() {
		return busId;
	}

	public void setBusId(int busId) {
		this.busId = busId;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSeats() {
		return seats;
	}

	public void setSeats(int seats) {
		this.seats = seats;
	}

	public double getTicketRate() {
		return ticketRate;
	}

	public void setTicketRate(double ticketRate) {
		this.ticketRate = ticketRate;
	}

	@Override
	public String toString() {
		return "Bus [busId=" + busId + ", name=" + name + ", from=" + from + ", to=" + to + ", seats=" + seats
				+ ", ticketRate=" + ticketRate + "]";
	}

}

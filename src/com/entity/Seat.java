package com.entity;

public class Seat {

	private int seatId;    //Ö÷¼ü£¬×ÔÔö
	private Room roomId = new Room();
	private int seatNum;
	private int seatState;
	
	public int getSeatId() {
		return seatId;
	}
	public void setSeatId(int seatId) {
		this.seatId = seatId;
	}
	public Room getRoomId() {
		return roomId;
	}
	public void setRoomId(Room roomId) {
		this.roomId = roomId;
	}
	public int getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(int seatNum) {
		this.seatNum = seatNum;
	}
	public int getSeatState() {
		return seatState;
	}
	public void setSeatState(int seatState) {
		this.seatState = seatState;
	} 
	
	
}

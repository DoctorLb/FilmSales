package com.entity;

public class Room {

	private int roomId ;	//放映厅号
	private int seatRows;   //该放映厅有多少排
	private int seatCols;   //该放映厅有多少列
	
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public int getSeatRows() {
		return seatRows;
	}
	public void setSeatRows(int seatRows) {
		this.seatRows = seatRows;
	}
	public int getSeatCols() {
		return seatCols;
	}
	public void setSeatCols(int seatCols) {
		this.seatCols = seatCols;
	}
	
	
}

package com.entity;

public class FilmShow {

	private int showId;        //£¨Ö÷¼ü£©×ÔÔö
	private Film filmId = new Film();
	private Seat roomId = new Seat();
	private String showDate;
	private String showTime;
	private double filmPrice;
	
	public int getShowId() {
		return showId;
		
	}
	public void setShowId(int showId) {
		this.showId = showId;
	}
	public Film getFilmId() {
		return filmId;
	}
	public void setFilmId(Film filmId) {
		this.filmId = filmId;
	}
	public Seat getRoomId() {
		return roomId;
	}
	public void setRoomId(Seat roomId) {
		this.roomId = roomId;
	}
	public String getShowDate() {
		return showDate;
	}
	public void setShowDate(String showDate) {
		this.showDate = showDate;
	}
	public String getShowTime() {
		return showTime;
	}
	public void setShowTime(String showTime) {
		this.showTime = showTime;
	}
	public double getFilmPrice() {
		return filmPrice;
	}
	public void setFilmPrice(double filmPrice) {
		this.filmPrice = filmPrice;
	}
	
	
	
}

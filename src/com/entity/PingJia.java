package com.entity;

public class PingJia {

	private int id;    //主键（自增）
	private Film filmId = new Film();
	private UserInfo userId = new UserInfo();
	private String pingJia;  //评价内容
	private String time;     //评价时间
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Film getFilmId() {
		return filmId;
	}
	public void setFilmId(Film filmId) {
		this.filmId = filmId;
	}
	public UserInfo getUserId() {
		return userId;
	}
	public void setUserId(UserInfo userId) {
		this.userId = userId;
	}
	public String getPingJia() {
		return pingJia;
	}
	public void setPingJia(String pingJia) {
		this.pingJia = pingJia;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
}

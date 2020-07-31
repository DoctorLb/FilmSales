package com.entity;

public class Film {

	private int filmId;              //电影Id（自增）
	private String filmName;         //电影名
	private int filmLong;			 //电影播放长度
	private String director;	     //电影导演
	private String actor;			 //电影演员
	private String filmType;		 //电影类型
	private String filmLanguage;	 //电影语言
	private String filmImg;			 //电影图片
	private String JianJie;			 //电影简介
	private int filmState;			 //电影状态（0:表示正在热映即可以订票的；1：表示即将上映的；2：都不是）
	private int filmScore;
	
	public int getFilmId() {
		return filmId;
	}
	public void setFilmId(int filmId) {
		this.filmId = filmId;
	}
	public String getFilmName() {
		return filmName;
	}
	public void setFilmName(String filmName) {
		this.filmName = filmName;
	}
	public int getFilmLong() {
		return filmLong;
	}
	public void setFilmLong(int filmLong) {
		this.filmLong = filmLong;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getFilmType() {
		return filmType;
	}
	public void setFilmType(String filmType) {
		this.filmType = filmType;
	}
	public String getFilmLanguage() {
		return filmLanguage;
	}
	public void setFilmLanguage(String filmLanguage) {
		this.filmLanguage = filmLanguage;
	}
	public String getFilmImg() {
		return filmImg;
	}
	public void setFilmImg(String filmImg) {
		this.filmImg = filmImg;
	}
	public String getJianJie() {
		return JianJie;
	}
	public void setJianJie(String jianJie) {
		JianJie = jianJie;
	}
	public int getFilmState() {
		return filmState;
	}
	public void setFilmState(int filmState) {
		this.filmState = filmState;
	}
	public int getFilmScore() {
		return filmScore;
	}
	public void setFilmScore(int filmScore) {
		this.filmScore = filmScore;
	}
	
	
}

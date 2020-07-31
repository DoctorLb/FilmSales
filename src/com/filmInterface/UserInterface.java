package com.filmInterface;

import java.util.ArrayList;

import com.entity.Film;
import com.entity.FilmShow;
import com.entity.HaiBao;
import com.entity.HuoDong;
import com.entity.UserInfo;
import com.entity.Vip;

public interface UserInterface {

	
	/**
	 * 用户注册
	 * */
	public int userReg(UserInfo user);
	
	/**
	 * 用户登录
	 * */
	public UserInfo userLogin(String userId,String userPwd);
	
	/**
	 * 用户查询个人信息
	 * */
	public UserInfo selectMe(String userId);
	
	/**
	 * 用户修改个人信息
	 * */
	public int updMe(String userId);
	
	/**
	 * 用户充值
	 * */
	public int addMoney(String userId);
	
	/**
	 * 用户查询（按电影名查询）
	 * */
	public Film selFilmByName(String filmName);
	
	/**
	 * 用户查询所有正在热映的电影
	 * */
	public Film selFilmShowing();
	
	/**
	 * 用户查询所有即将上映的电影
	 * */
	public Film selFilmWill();
	
	/**
	 * 用户购买电影票
	 * */
	public Film buyTicket();
	
	/**
	 * 用户关注排行榜查询
	 * */
	public ArrayList<Film> selFilmScore();
	
	/**
	 * 查询网站推荐正在上映的电影
	 * */
	public ArrayList<FilmShow> selFilmAdminShow();
	
	/**
	 * 查询网站推荐即将上映的电影
	 * */
	public ArrayList<Film> selFilmAdminWill();
	
	/**
	 * 查询网站推荐的电影的海报
	 * */
	public ArrayList<HaiBao> selFilmHaiBao();
	
	/**
	 * 查询网站活动
	 * */
	public ArrayList<HuoDong> selHuoDong();
	
	/**
	 * 查询所有正在放映的电影
	 * */
	
	public ArrayList<String> selFilmName();
	
	/**
	 * 查询电影的放映时间
	 * */
	public ArrayList<String> selFilmTime(String filmName);
	
	/**
	 * 查询电影的放映厅
	 * */
	public ArrayList<Object> selFilmRoom(String filmName,String filmTime);
	
	/**
	 * 用户查询要订票的电影的详细信息
	 * */
	public ArrayList<FilmShow> selFilmShowInfo(String name,String time,String room);
	
	/**
	 * 查询放映厅的座位情况(几排，几列)
	 * */
	public int[] selRoom(int roomId);
	
	/**
	 * 判断座位是否损坏（0：没有，1：坏了）
	 * */
	public int selSeatState(int roomId,int seatNum);
	/**
	 * 查询座位是否已被订购
	 * */
	public boolean selSeatNum(int showId,int seatNum);
	
	/**
	 * 查询会员优惠条件
	 * */
	public Vip selectVip(int num);
	
	/**
	 * 用户付款的方法
	 * */
	public int FuKuan(String userId,String showId,String[] seatNum,String price);
	
	/**
	 * 查询用户在某个场次已定过几张票
	 * */
	public int seleNum(String userId,int showId);
	
	/**
	 * 按订单号查询订单
	 * */
	public ArrayList selOrder(String ticketId,String userId,String userPwd);
	
	/**
	 * 用户退订
	 * */
	public int delTicket(String ticketId,double money,String userId);
}

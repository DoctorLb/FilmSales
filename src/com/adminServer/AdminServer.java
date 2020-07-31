package com.adminServer;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.entity.Admin;
import com.entity.Film;
import com.entity.FilmShow;
import com.entity.Money;
import com.entity.Room;
import com.entity.Seat;
import com.entity.UserInfo;
import com.filmDao.DBHelp;

public class AdminServer {
	DBHelp db=new DBHelp();
/**
 * 登录 少一个参数
 * */
	public Admin adminLogin(String adminId){
		String sql="select adminId,adminPwd from admin where adminId=?";
		Object[] o={adminId};
		ResultSet rs=db.selSql(sql, o);
		try {
			if(rs.next()){
				Admin ad=new Admin();
				ad.setAdminId(rs.getString("adminId"));
				ad.setAdminPwd(rs.getString("adminPwd"));
				return ad;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return null;
	}
/**
 * 添加电影
 * */
	public int addFilm(Film film){
		int row=0;
		String sql="insert into film (filmId,filmName,actor,director,filmImg,filmLanguage,filmLong,filmState,filmType,filmJianJie) values(default,?,?,?,?,?,?,?,?,?)";
		Object[] o={film.getFilmName(),film.getActor(),film.getDirector(),film.getFilmImg(),film.getFilmLanguage(),film.getFilmLong(),film.getFilmState(),film.getFilmType(),film.getJianJie()};
		row=db.updSql(sql, o);
		db.closeAll();
		return row;
	}
	/**
	 * 通过name 查找电影
	 * */
	public ArrayList<Film> selByName(String filmName){
		ArrayList<Film> list=new ArrayList<Film>();
		String sql="select * from film where filmName=?";
		Object[] o={filmName};
		ResultSet rs=db.selSql(sql, o);
		try {
			list = db.executeQuery(sql, o);
			return list;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return null;
	}
	
	/**
	 * 查询所有电影
	 * */
	public ArrayList<Film> selAll(){
		ArrayList<Film> list=new ArrayList<Film>();
		String sql="select * from film";		
		try {
			ResultSet rs = db.getConn().prepareStatement(sql).executeQuery();
			while(rs.next()){
				Film film=new Film();
				film.setFilmId(rs.getInt("filmId"));
				film.setActor(rs.getString("actor"));
				film.setDirector(rs.getString("director"));
				film.setFilmImg(rs.getString("filmImg"));
				film.setFilmLanguage(rs.getString("filmLanguage"));
				film.setFilmLong(rs.getInt("filmLong"));
				film.setFilmName(rs.getString("filmName"));
				film.setFilmState(rs.getInt("filmState"));
				film.setFilmType(rs.getString("filmType"));
				film.setJianJie(rs.getString("filmJianJie"));
				list.add(film);
			}
			return list;
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		db.closeAll();
		return null;
	}
	
	/**
	 * 改变电影状态
	 * */
	public int updFilmState(int filmId,int filmState){
		int row=0;
		String sql="update film set filmState=? where filmId=?";
		Object o[]={filmState,filmId};
		row=db.updSql(sql, o);
		db.closeAll();
		return row;
	}
	/**
	 * 查找状态为2的film
	 * */
	public ArrayList<Film> selDownFilm(){
		ArrayList<Film> list=new ArrayList<Film>();
		String sql="select * from film where filmState='2'";
		try {
			ResultSet rs=db.getConn().prepareStatement(sql).executeQuery();
			while(rs.next()){
				Film film=new Film();
				film.setActor(rs.getString("actor"));
				film.setDirector(rs.getString("director"));
				film.setFilmId(rs.getInt("filmId"));
				film.setFilmImg(rs.getString("filmImg"));
				film.setFilmLanguage(rs.getString("filmLanguage"));
				film.setFilmLong(rs.getInt("filmLong"));
				film.setFilmName(rs.getString("filmName"));
				film.setFilmState(rs.getInt("filmState"));
				film.setFilmType(rs.getString("filmType"));
				film.setJianJie(rs.getString("filmJianJie"));
				list.add(film);
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		db.closeAll();
		return list;
	}
	/**
	 * 删除所有状态为2的film
	 * */
	public int delFilm(){
		
		int row=0;
		String sql="delete from film where filmState='2'";
		try {
			row=db.getConn().prepareStatement(sql).executeUpdate();	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return row;
	}
	/**
	 * 通过id删除电影
	 * */
	public int delById(int id){
		int row=0;
		String sql="delete from film where filmId=?";
		Object[] o={id};
		row=db.updSql(sql, o);
		return row;
	}
	/**
	 * 查找所有的用户，分页查询，从零开始
	 * */
	public ArrayList<UserInfo> selAllUser(int pages){
		ArrayList<UserInfo> list = new ArrayList<UserInfo>();
		String sql="select * from userInfo limit "+(pages*10)+",10";
		try {
			ResultSet rs=db.getConn().prepareStatement(sql).executeQuery();
			while(rs.next()){
				UserInfo user=new UserInfo();
				user.setUserId(rs.getString("userId"));
				user.setUserEmail(rs.getString("userEmail"));
				user.setUserIdCard(rs.getString("userIdCard"));
				user.setUserMoney(rs.getDouble("userMoney"));
				user.setUserName(rs.getString("userName"));
				user.setUserPwd(rs.getString("userPwd"));
				user.setUserScore(rs.getInt("userScore"));
				user.setUserSex(rs.getString("userSex"));
				user.setUserTelephone(rs.getString("userTelephone"));
				list.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;		
	}
	/**
	 * 查询一共多少用户
	 * */
	public int rowCount(){
		int row=0;
		String sql="select count(*) from userInfo";
		try {
			ResultSet rs=db.getConn().prepareStatement(sql).executeQuery();
			while(rs.next()){
				row=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}
	/**
	 * 查询正在上映的电影
	 * */
	public ArrayList<Film> selShowing(){
		ArrayList<Film> list = new ArrayList<Film>();
		String sql="select film.filmId,film.filmName,film.filmState from "
				+ "filmshow inner join film on film.filmId=filmshow.filmId";
		try {
			ResultSet rs=db.getConn().prepareStatement(sql).executeQuery();
			while(rs.next()){
				Film film=new Film();
				film.setFilmId(rs.getInt("filmId"));
				film.setFilmName(rs.getString("filmName"));
				film.setFilmState(rs.getInt("filmState"));
				list.add(film);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	/**
	 * 更新热映的电影
	 * */
	public int updHotFilm(int filmId,int id){
		int row=0;
		String sql="update admin_showing set filmId='"+filmId+
				"' where id='"+id+"'";
		try {
			row=db.getConn().prepareStatement(sql).executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}
	/**
	 * 查询下架的电影
	 * */
	public ArrayList<Film> selFilmUnShow(){
		ArrayList<Film> list = new ArrayList<Film>();
		String sql="select FilmId,filmName,filmState from film "
				+ "where filmState=1 or filmState=2";
		try {
			ResultSet rs=db.getConn().prepareStatement(sql).executeQuery();
			while(rs.next()){
				Film film=new Film();
				film.setFilmId(rs.getInt("filmId"));
				film.setFilmName(rs.getString("filmName"));
				film.setFilmState(rs.getInt("filmState"));
				list.add(film);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	/**
	 * 查询电影放映房间
	 * */
	public ArrayList<FilmShow> selFilmRoom(int roomId){
		ArrayList<FilmShow> list=new ArrayList<FilmShow>();
		String sql="select * from filmshow,film "
				+ "where film.filmId=filmshow.filmId and filmshow.roomId='"+roomId+"'";
		try {
			ResultSet rs=db.getConn().prepareStatement(sql).executeQuery();
			while(rs.next()){
				FilmShow fs=new FilmShow();
				fs.getFilmId().setFilmId(rs.getInt("filmId"));
				Room room = new Room();
				room.setRoomId(rs.getInt("roomId"));
				Seat seat = new Seat();
				seat.setRoomId(room);
				fs.setRoomId(seat);
				fs.setShowDate(rs.getString("showDate"));
				fs.setShowTime(rs.getString("showTime"));
				fs.getFilmId().setFilmLong(rs.getInt("filmLong"));
				fs.getFilmId().setFilmName(rs.getString("filmName"));
				list.add(fs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 添加放映列表
	 * */
	public int addToPlayList(FilmShow fs){
		int row=0;
		String sql="insert into filmshow values(default,?,?,?,?,?)";
		Object[] o={fs.getFilmId().getFilmId(),fs.getRoomId().getRoomId().getRoomId(),fs.getShowDate(),fs.getShowTime(),fs.getFilmPrice()};
		row=db.updSql(sql, o);
		return row;
	}
	/**
	 * 通过电影名字查看收入
	 * */
	public double selMoneyByFilmName(String filmName){
		double totalMoney=0;
		String sql="select sum(ticket.price) from ticket inner join filmshow on ticket.showId=filmshow.showId inner join film on filmshow.filmId=film.filmId where film.filmName=?";
		Object[] o={filmName};
		ResultSet rs=db.selSql(sql, o);
		try {
			if(rs.next()){
				totalMoney=rs.getDouble(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return totalMoney;
	}
	/**
	 * 查询所有的收入
	 * */
	public ArrayList<Money> selAllMoney(){
		ArrayList<Money> list =new ArrayList<Money>();
		String sql="select film.filmName,sum(ticket.price) from ticket inner join filmshow on ticket.showId=filmshow.showId inner join film on filmshow.filmId=film.filmId group by filmName";
		try {
			ResultSet rs=db.getConn().prepareStatement(sql).executeQuery();
			while(rs.next()){
				Money m=new Money();
				m.getFilm().setFilmName(rs.getString("filmName"));
				m.setMoney(rs.getDouble(2));
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
 /**
  * 更新密码
  * */
	
	public int updPwd(String newPwd){
		int row=0;
		String sql="update admin set adminPwd='"+newPwd+"' where adminId='admin'";
		try {
			row=db.getConn().prepareStatement(sql).executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}

}

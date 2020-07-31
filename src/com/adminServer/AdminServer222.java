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

public class AdminServer222 {
	DBHelp db=new DBHelp();
/**
 * ???
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
 * ???
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
	 * ?????????
	 * */
	public ArrayList<Film> selByName(String filmName){
		ArrayList<Film> list=new ArrayList<Film>();
		String sql="select * from film where filmName=?";
		Object[] o={filmName};
		ResultSet rs=db.selSql(sql, o);
		try {
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
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return null;
	}
	
	/**
	 * ???????
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
	 * ?????????????
	 * */
	public int updFilmState(int filmId,int filmState){
		int row=0;
		String sql="update film set filmState=? where filmId=?";
		Object o[]={filmState,filmId};
		row=db.updSql(sql, o);
		db.closeAll();
		db.closeAll();
		return row;
	}
	/**
	 * ???????¦Ä?????????
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
	 * ?????¦Ä?????????
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
	 * ????????
	 * */
	public int delById(int id){
		int row=0;
		String sql="delete from film where filmId=?";
		Object[] o={id};
		row=db.updSql(sql, o);
		return row;
	}
	/**
	 * ??????
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
	 * ???????????
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
	 * ?????????????
	 * */
	public ArrayList<Film> selShowing(){
		ArrayList<Film> list = new ArrayList<Film>();
		String sql="select film.filmId,film.filmName,film.filmState from filmshow inner join film on film.filmId=filmshow.filmId";
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
	 * ?????????
	 * */
	public int updHotFilm(int filmId,int id){
		int row=0;
		String sql="update admin_showing set filmId='"+filmId+"' where id='"+id+"'";
		try {
			row=db.getConn().prepareStatement(sql).executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}
	/**
	 * ???¦Ä????????????????
	 * */
	public ArrayList<Film> selFilmUnShow(){
		ArrayList<Film> list = new ArrayList<Film>();
		String sql="select FilmId,filmName,filmState from film where filmState=1 or filmState=2";
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
	 * ???????????
	 * */
	public ArrayList<FilmShow> selFilmRoom(int roomId){
		ArrayList<FilmShow> list=new ArrayList<FilmShow>();
		String sql="select * from filmshow,film where film.filmId=filmshow.filmId and filmshow.roomId='"+roomId+"'";
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
	 * ???????
	 * */
	
	
	
	/**
	 * ???????
	 * */
	public int addToPlayList(FilmShow fs){
		int row=0;
		String sql="insert into filmshow values(default,?,?,?,?,?)";
		Object[] o={fs.getFilmId().getFilmId(),fs.getRoomId().getRoomId().getRoomId(),fs.getShowDate(),fs.getShowTime(),fs.getFilmPrice()};
		row=db.updSql(sql, o);
		return row;
	}
	/**
	 * ????????????
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
	 * ???????????
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
  * ???????
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
	/**
	 * ????
	 * */
	
	/*public static void main(String[] args) {
		AdminServer as=new AdminServer();
		ArrayList<Money> list=as.selAllMoney();
		for(int i=0;i<list.size();i++){
			System.out.println(list.get(i).getFilm().getFilmName());
			System.out.println(list.get(i).getMoney());
		}
	}*/
}

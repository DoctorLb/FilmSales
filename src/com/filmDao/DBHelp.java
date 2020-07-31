package com.filmDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.entity.Film;

public class DBHelp {

	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	/**
	 * 数据库链接
	 * */
	public Connection getConn(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/filmdb","root","123");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
		
	}
	
	/**
	 * 执行更新操作
	 * */
	public int updSql(String sql,Object[] o){
		int row = 0;
		conn =getConn();
		try {
			ps = conn.prepareStatement(sql);
			if(o.length>0){
				for(int i=0;i<o.length;i++){
					// 从一开始
					ps.setObject(i+1, o[i]);
				}
			}
			row = ps.executeUpdate();
			return row;
			//System.out.println(row+"#####################");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}
	
	/**
	 * 查询语句
	 * */ 
	public ResultSet selSql(String sql,Object[] o){
		conn =getConn();
		try {
			ps = conn.prepareStatement(sql);
			if(o.length>0){
				for(int i=0;i<o.length;i++){
					ps.setObject(i+1, o[i]);
				}
			}
			rs = ps.executeQuery();
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	/**
	 * 执行电影的查询
	 * */
	public ArrayList<Film> executeQuery(String sql,Object[]o){
		ResultSet rs=null;
		//锟斤拷锟斤拷ArrayList锟斤拷锟斤拷
		ArrayList<Film> list =new ArrayList<Film>();
		try {
			PreparedStatement ps =getConn().prepareStatement(sql);
			if(o!=null){
				for (int i = 0; i < o.length; i++) {
					ps.setObject(i+1, o[i]);
				}
			}
			//执行查询操作
			rs=ps.executeQuery();
			while(rs.next()){
				Film movie = new Film();
				movie.setFilmId(rs.getInt("filmId"));
				movie.setFilmName(rs.getString("filmName"));
				movie.setFilmLong(rs.getInt("filmLong"));
				movie.setJianJie(rs.getString("filmJianJie"));
				movie.setDirector(rs.getString("director"));
				movie.setActor(rs.getString("actor"));
				movie.setFilmImg(rs.getString("filmImg"));
				movie.setFilmType(rs.getString("filmType"));
				movie.setFilmLanguage(rs.getString("filmLanguage"));
				movie.setFilmState(rs.getInt("filmState"));
				movie.setFilmScore(rs.getInt("filmScore"));
				list.add(movie);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 关闭链接
	 * */
	public void closeAll(){
		try{
			if(rs!=null){
				rs.close();
			}
			if(ps!=null){
				ps.close();
			}
			if(conn!=null){
				conn.close();
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}	
	}
	/*public int executeUpdate(){
		int row = 0;
		for(int i=1;i<7;i++){
			for(int j=1;j<82;j++){
				String sql = "insert into seat(seatId,roomId,seatNum,seatState) " +
				"values(default,'"+i+"','"+j+"',default)";
				try {
					int num = getConn().prepareStatement(sql).executeUpdate();
					if(num>0){
						row++;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return row;
	}*/
}
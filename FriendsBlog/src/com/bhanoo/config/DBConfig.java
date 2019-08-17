package com.bhanoo.config;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConfig {
	private static final String DBDRIVER="org.h2.Driver";
	private static final String DBURL="jdbc:h2:tcp://localhost/~/FriendsProject";
	private static final String DBUSERNAME="sa";
	private static final String DBPASSWORD="";
	private static Statement stmt=null;
	
	private static void openConnection() {
		try {
			Class.forName(DBDRIVER);
			Connection conn=DriverManager.getConnection(DBURL,DBUSERNAME,DBPASSWORD);
			stmt=conn.createStatement();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static int executeUpdate(String sql)
	{
		try {
			openConnection();
			return stmt.executeUpdate(sql);//for all Transactional query
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return -1;
		}
	}
	
	
	public static ResultSet executeQuery(String sql)
	{
		try {
			openConnection();
			return stmt.executeQuery(sql);//for all Transactional query
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
	

}

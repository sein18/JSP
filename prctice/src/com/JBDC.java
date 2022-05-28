package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JBDC {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("01. 드라이버 연결");
		} catch (ClassNotFoundException e) {
			System.out.println("01.드라이버 연결 실패");
			e.printStackTrace();
		}
		try {
			con = DriverManager.getConnection("JDBC:mysql://localhost:3306/multi","root","1234");
			System.out.println("02.계정 연결");
			
			con.setAutoCommit(false);
		} catch (SQLException e) {
			System.out.println("02.계정 연결 실패");
			e.printStackTrace();
		}
		return con;
	}
	
}

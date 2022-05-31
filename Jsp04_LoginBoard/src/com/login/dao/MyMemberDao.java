package com.login.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException; 
import java.util.ArrayList;
import java.util.List;

import com.login.dto.MyMemberDto;
import com.mysql.cj.protocol.Resultset;

import static common.JDBCTemplate.*;

public class MyMemberDao {

	// login
	public MyMemberDto login(String id, String pw) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MyMemberDto res = new MyMemberDto();

		String sql = " SELECT * FROM MYMEMBER WHERE MYID=? AND MYPW=? AND MYENABLED=?";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			pstm.setString(2, pw);
			pstm.setString(3, "Y");
			System.out.println("03.query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");

			while (rs.next()) {
				res.setMyno(rs.getInt(1));
				res.setMyid(rs.getString(2));
				res.setMypw(rs.getString(3));
				res.setMyname(rs.getString(4));
				res.setMyaddr(rs.getString(5));
				res.setMyphone(rs.getString(6));
				res.setMyemail(rs.getString(7));
				res.setMyenabled(rs.getString(8));
				res.setMyrole(rs.getString(9));
			}

		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			System.out.println("05.db 종료\n");
			close(con, pstm, rs);
		}

		return res;

	}

	public List<MyMemberDto> selectAll() {
		List<MyMemberDto> list = new ArrayList<MyMemberDto>();
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = " SELECT *FROM MYMEMBER ORDER BY MYNO DESC ";

		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");

			while (rs.next()) {
				MyMemberDto tmp = new MyMemberDto();
				tmp.setMyno(rs.getInt(1));
				tmp.setMyid(rs.getString(2));
				tmp.setMypw(rs.getString(3));
				tmp.setMyname(rs.getString(4));
				tmp.setMyaddr(rs.getString(5));
				tmp.setMyphone(rs.getString(6));
				tmp.setMyemail(rs.getString(7));
				tmp.setMyenabled(rs.getString(8));
				tmp.setMyrole(rs.getString(9));

				list.add(tmp);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(con, pstm, rs);
		}

		return list;
	}

	// 아이디 중복체크
	public String idChk(String id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String res = null;
		String sql = " SELECT *FROM MYMEMBER WHERE MYID=? "; 
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			System.out.println("03.query 준비: " +sql);
			
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			
			while(rs.next()) {
				res = rs.getString(2);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			System.out.println("05.db 종료 \n");
			close(con,pstm,rs);
		}
		
		return res;
	}
	
	public int insertUser(MyMemberDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " INSERT INTO MYMEMBER VALUES(NULL,?,?,?,?,?,?,'Y','user') ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getMyid());
			pstm.setString(2, dto.getMypw());
			pstm.setString(3, dto.getMyname());
			pstm.setString(4, dto.getMyaddr());
			pstm.setString(5, dto.getMyphone());
			pstm.setString(6, dto.getMyemail());
			System.out.println("03.query 준비: " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}else {
				rollback(con);
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			System.out.println("05.db 종료\n");
			close(con,pstm);
		}
		return res;
	}
	public int updatepw(String mypw, String myid) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int rs = 0;
		
		String sql = "UPDATE MYMEMBER SET MYPW=? WHERE MYID=? ";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, mypw);
			pstm.setString(2, myid); 
			rs = pstm.executeUpdate();
			if(rs>0) {
				commit(con);
			}else {
				rollback(con);
			}
		} catch (SQLException e) { 
			e.printStackTrace();
		}finally {
			close(con,pstm);
		}
		
		return rs;
	}

}

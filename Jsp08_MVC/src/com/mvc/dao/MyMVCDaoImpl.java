package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mvc.dto.MyMVCDto; 
import static common.JDBCTemplate.*;

public class MyMVCDaoImpl implements MyMVCDao{

	@Override
	public List<MyMVCDto> selectAll(Connection con) {
		List<MyMVCDto> res = new ArrayList<MyMVCDto>(); 
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			pstm = con.prepareStatement(selectAllSql);
			System.out.println("03.query 준비: " + selectAllSql);
			
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			while(rs.next()) {
				MyMVCDto tmp = new MyMVCDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5));
				res.add(tmp);
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			System.out.println("05. db 종료\n");
		}
		return res;
	}

	@Override
	public MyMVCDto selectOne(Connection con, int seq) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MyMVCDto res = null;
		
		try {
			pstm = con.prepareStatement(selectOneSql);
			pstm.setInt(1, seq);
			System.out.println("03.query 준비: " + selectAllSql);
			
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			
			while (rs.next()) {
				res = new MyMVCDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5));
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			System.out.println("05. db 종료\n");
		}
		return res;
	}

	@Override
	public boolean insert(Connection con, MyMVCDto dto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(insertSql);
			pstm.setString(1, dto.getWriter());
			pstm.setString(2, dto.getTitle());
			pstm.setString(3, dto.getContent());
			System.out.println("03.query 준비: " + insertSql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");

		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			System.out.println("05. db 종료\n");
		}
		return res > 0;
	}

	@Override
	public boolean update(Connection con, MyMVCDto dto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm= con.prepareStatement(updateSql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setInt(3, dto.getSeq());
			System.out.println("03.query 준비: " + insertSql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			System.out.println("05. db 종료\n");
		}

		return res > 0;
	}

	@Override
	public boolean delete(Connection con, int seq) {
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm= con.prepareStatement(deleteSql);
			pstm.setInt(1, seq);
			System.out.println("03.query 준비: " + deleteSql);
			
			res =pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			System.out.println("05. db 종료\n");
		}

		return res > 0;
	}
	
}

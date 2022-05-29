package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dto.Boarddto;
import static com.JBDC.*;

public class Boarddao {
	
	public List<Boarddto> selectAll(){
		Connection con = getConnection();
		List<Boarddto> list = new ArrayList<Boarddto>();
		Statement stmt = null;
		ResultSet res = null;
		String sql = " SELECT * FROM MVCBOARD ORDER BY SEQ DESC ";
		
		try {
			stmt = con.createStatement();
			res = stmt.executeQuery(sql);
			while(res.next()) {
				Boarddto tmp = new Boarddto();
				tmp.setSeq(res.getInt(1));
				tmp.setWriter(res.getString(2));
				tmp.setTitle(res.getString(3));
				tmp.setContent(res.getString(4));
				tmp.setRegdate(res.getDate(5));
				
				list.add(tmp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(con,stmt,res);
		}
		return list;
	}

	public Boarddto selectOne(int seq) {
		
		
		return null;
	}
}

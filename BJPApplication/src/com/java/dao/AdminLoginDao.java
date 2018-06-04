package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.java.userbean.Userbean;

public class AdminLoginDao {

	public static void insert(Userbean user) {

		try {
			ConnectionSteps steps = new ConnectionSteps();
			Connection conn=steps.connection();
			PreparedStatement pstmt = conn.prepareStatement("select * from admintable where username=? and password=?");
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword()); 
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				 user.setValid(true);
				 user.setId(rs.getInt("id"));
				 user.setFirstname(rs.getString("firstname"));		
				user.setMiddlename(rs.getString("middlename"));
				user.setLastname(rs.getString("lastname"));
				user.setEmail(rs.getString("email"));
				user.setMobile(Long.parseLong(rs.getString("mobile")));
				user.setGender(rs.getString("gender"));
				
				
				
				
			}
			else {
				
				user.setValid(false);
			}
			
		} catch (Exception e) {

			System.out.println(e);
		}
		
		
		
	}

}

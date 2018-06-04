package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.java.userbean.Userbean;

public class DivisionLogin {

	public static void insert(Userbean user) {

		try {
			ConnectionSteps steps = new ConnectionSteps();
			Connection conn=steps.connection();
			PreparedStatement pstmt = conn.prepareStatement("select * from divisiontable where username=? and password=?");
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword()); 
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				 user.setValid(true);
				 user.setId(rs.getInt("id"));
				 user.setConstitution(rs.getString("constitution"));
				 user.setDivision(rs.getString("division"));
				 user.setFirstname(rs.getString("firstname"));
				 user.setMiddlename(rs.getString("middlename"));
				 user.setLastname(rs.getString("lastname"));
				 user.setEmail(rs.getString("email"));
				 user.setGender(rs.getString("gender"));
				 user.setMobile(rs.getLong("mobile"));
			}
			else {
				
				user.setValid(false);
			}
			
		} catch (Exception e) {

			System.out.println(e);
		}
		
		
	
}
	
}

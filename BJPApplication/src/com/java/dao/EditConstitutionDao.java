package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.java.userbean.Userbean;

public class EditConstitutionDao {

	public static void insert(Userbean user) {

		
		try {
			ConnectionSteps steps = new ConnectionSteps();
			Connection conn=steps.connection();
			PreparedStatement pstmt = conn.prepareStatement("update constitutiontable set firstname=?,middlename=?,lastname=?,username=?,password=?,email=?,mobile=? where constitution=?");
			pstmt.setString(1, user.getFirstname());
			pstmt.setString(2, user.getMiddlename());
            pstmt.setString(3, user.getLastname());
            pstmt.setString(4, user.getUsername());
            pstmt.setString(5, user.getPassword());
            pstmt.setString(6, user.getEmail());
            pstmt.setLong(7, user.getMobile());
            pstmt.setString(8, user.getConstitution());
            
            int n =pstmt.executeUpdate();
        	if(n==1)
        	{
        		System.out.println("success");
        		user.setValid(true);
        		
        		
        	}
        	else
        	{
        		System.out.println("not success");
        		user.setValid(false);
        	}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}

package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashSet;

import com.java.userbean.Userbean;

public class EditAdminDao {

	public static void insert(Userbean user) {

		
		try {
			ConnectionSteps steps = new ConnectionSteps();
			Connection conn=steps.connection();
			System.out.println(user.getFirstname());
			System.out.println(user.getMiddlename());
			System.out.println(user.getLastname());
			System.out.println(user.getUsername());
			System.out.println(user.getPassword());
			System.out.println(user.getEmail());
			System.out.println(user.getMobile());
			System.out.println(user.getId());
			PreparedStatement pstmt = conn.prepareStatement("update admintable set firstname=?,middlename=?,lastname=?,username=?,password=?,email=?,mobile=? where id=?");
			pstmt.setString(1, user.getFirstname());
			pstmt.setString(2, user.getMiddlename());
            pstmt.setString(3, user.getLastname());
            pstmt.setString(4, user.getUsername());
            pstmt.setString(5, user.getPassword());
            pstmt.setString(6, user.getEmail());
            pstmt.setLong(7, user.getMobile());
            pstmt.setInt(8, user.getId());
           
            
            int n =pstmt.executeUpdate();
        	if(n==1)
        	{
        		System.out.println("success");
        		user.setValid(true);
        		
        		
        	}
        	else
        	{
        		System.out.println(" dao not success");
        		user.setValid(false);
        	}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}

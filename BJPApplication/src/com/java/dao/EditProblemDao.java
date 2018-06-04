package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.java.userbean.Userbean;

public class EditProblemDao {

	public static void insert(Userbean user) {

		
		try {
			ConnectionSteps steps = new ConnectionSteps();
			Connection conn=steps.connection();
			PreparedStatement pstmt = conn.prepareStatement("update problemtable set email=? , firstname=?,middlename=?,lastname=?,mobile=?,textarea=? where constitution=? and division=? and problemtype=?");
			
			pstmt.setString(1, user.getEmail());
            pstmt.setString(2, user.getFirstname());
            pstmt.setString(3, user.getMiddlename());
           pstmt.setString(4, user.getLastname());
           pstmt.setLong(5, user.getMobile());
           pstmt.setString(6, user.getTextarea());
			pstmt.setString(7, user.getConstitution());
			pstmt.setString(8, user.getDivision());
            pstmt.setString(9, user.getProblemtype());
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

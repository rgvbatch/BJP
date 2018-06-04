package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.java.userbean.Userbean;

public class ProblemDao {

	public static void insert(Userbean user) {

		
		try {
			ConnectionSteps steps = new ConnectionSteps();
			Connection conn=steps.connection();
			PreparedStatement pstmt = conn.prepareStatement("insert into Problemtable(constitution,division,firstname,middlename,lastname,email,gender,mobile,problemtype,textarea,id,datetime) values(?,?,?,?,?,?,?,?,?,?,?,current_timestamp)");
			pstmt.setString(1, user.getConstitution());
			pstmt.setString(2, user.getDivision());
			pstmt.setString(3, user.getFirstname());
			pstmt.setString(4, user.getMiddlename());
			pstmt.setString(5, user.getLastname());
            pstmt.setString(6, user.getEmail());
            pstmt.setString(7, user.getGender());
            pstmt.setLong(8, user.getMobile());
            pstmt.setString(9, user.getProblemtype());
            pstmt.setString(10, user.getTextarea());
            {
                PreparedStatement pstmt1 = conn.prepareStatement("select id from constitutiontable where constitution=?");
                pstmt1.setString(1, user.getConstitution());
                ResultSet rs=pstmt1.executeQuery();
                if(rs.next()) {
           	
                 	user.setId(rs.getInt("id"));
                }
           }
            pstmt.setInt(11, user.getId());
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

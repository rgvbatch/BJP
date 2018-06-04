package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;

import com.java.userbean.Userbean;

public class DivisionDao {

	public static void insert(Userbean user) {

		
		try {
			String username = user.getUsername();
		
			ConnectionSteps steps = new ConnectionSteps();
			Connection conn=steps.connection();
			PreparedStatement pstmt1 =conn.prepareStatement("select * from divisiontable");
			ResultSet rs = pstmt1.executeQuery();
			HashSet<String> hs = new HashSet<>();
			while(rs.next())
			{
				hs.add(rs.getString("username"));
			}
			
			if(hs.contains(username))
			{
				user.setValid1(false);
			
			}else {
				user.setValid1(true);
			PreparedStatement pstmt = conn.prepareStatement("insert into divisiontable(constitution,division,firstname,middlename,lastname,username,password,email,gender,mobile,id,datetime) values(?,?,?,?,?,?,?,?,?,?,?,current_timestamp)");
			pstmt.setString(1, user.getConstitution());
			pstmt.setString(2, user.getDivision());
			pstmt.setString(3, user.getFirstname());
			pstmt.setString(4, user.getMiddlename());
			pstmt.setString(5, user.getLastname());
            pstmt.setString(6, user.getUsername());
            pstmt.setString(7, user.getPassword());
            pstmt.setString(8, user.getEmail());
            pstmt.setString(9, user.getGender());
            pstmt.setLong(10, user.getMobile());
            {
                 PreparedStatement pstmt2 = conn.prepareStatement("select id from constitutiontable where constitution=?");
                 pstmt2.setString(1, user.getConstitution());
                 ResultSet rs2=pstmt2.executeQuery();
                 if(rs2.next()) {
            	
                  	user.setId(rs2.getInt("id"));
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
		
		} }catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}

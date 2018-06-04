package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Iterator;

import com.java.userbean.Userbean;

public class ConstitutionDao {

	public static void insert(Userbean user) {

		
		try {
			
			String constitution=user.getConstitution();
			String username=user.getUsername();
			ConnectionSteps steps = new ConnectionSteps();
			Connection conn=steps.connection();
			PreparedStatement pstmt1 =conn.prepareStatement("select * from constitutiontable");
			ResultSet rs = pstmt1.executeQuery();
			HashSet<String> hs = new HashSet<>();
			while(rs.next())
			{
				hs.add(rs.getString("constitution"));
			}
			
			if(hs.contains(constitution))
			{
				user.setValid1(false);
			
			}else {
				user.setValid1(true);
				PreparedStatement pstmt2 =conn.prepareStatement("select * from constitutiontable");
				ResultSet rs1 = pstmt2.executeQuery();
				HashSet<String> hs1= new HashSet<>();
				while(rs1.next())
				{
					hs1.add(rs1.getString("username"));
				}
				 Iterator<String> itr=hs1.iterator();  
				  while(itr.hasNext()){  
				   System.out.println(itr.next());  
				  }  
				if(hs1.contains(username))	
				{
					user.setValid(false);
				
				}else {
			
			PreparedStatement pstmt = conn.prepareStatement("insert into constitutiontable(constitution,firstname,middlename,lastname,username,password,email,gender,mobile,datetime) values(?,?,?,?,?,?,?,?,?,current_timestamp)");
			pstmt.setString(1, user.getConstitution());
			pstmt.setString(2, user.getFirstname());
			pstmt.setString(3, user.getMiddlename());
			pstmt.setString(4, user.getLastname());
            pstmt.setString(5, user.getUsername());
            pstmt.setString(6, user.getPassword());
            pstmt.setString(7, user.getEmail());
            pstmt.setString(8, user.getGender());
            pstmt.setLong(9, user.getMobile());
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
		
		}}} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}

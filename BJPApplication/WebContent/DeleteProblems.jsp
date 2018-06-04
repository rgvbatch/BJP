
<%@page import="com.java.dao.ConnectionSteps"%>
<%@page import="com.java.userbean.Userbean"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Userbean user = (Userbean) session.getAttribute("ConstitutionSession");
	%>
	<%
		String problemtype = request.getParameter("problemtype");
		String division = request.getParameter("division");
		
		ConnectionSteps steps = new ConnectionSteps();
		Connection conn = steps.connection();
		PreparedStatement pstmt = conn.prepareStatement("delete from problemtable  where constitution=?  and division=? and problemtype=?");
		pstmt.setString(1, user.getConstitution());
		pstmt.setString(2,division);
		pstmt.setString(3,problemtype);
		int i =pstmt.executeUpdate();
		if(i>0)
		{
			//System.out.println("success");
			String theURL = "ConstitutionDivProblems.jsp?"+ "division="+division;
			response.sendRedirect(theURL);
			
		}else{
			
			
			//System.out.println("failed");
			response.sendRedirect("ConstitutionDivProblems.jsp?"+ "division="+division);
			
		}
		
	
	%>
	
</body>
</html>
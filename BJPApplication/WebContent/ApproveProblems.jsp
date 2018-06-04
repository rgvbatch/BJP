
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
Userbean user=(Userbean)session.getAttribute("ConstitutionSession");
%>
	<%
										    
											String problemtype= request.getParameter("problemtype");
                                            String division= request.getParameter("division");
                                            ConnectionSteps steps = new ConnectionSteps();
											Connection conn=steps.connection();PreparedStatement pstmt = conn.prepareStatement("update problemtable set status=? where constitution=? and division=? and problemtype=?");
											pstmt.setString(1, "approve");
											pstmt.setString(2, user.getConstitution());
											pstmt.setString(3,division);
											pstmt.setString(4,problemtype);
											int i =pstmt.executeUpdate();
											if(i>0)
											{   
												user.setValid(true);
												
												//System.out.println("success");
												response.sendRedirect("PendingProblems1.jsp");
												
											}else{
												
												user.setValid(false);
												//System.out.println("failed");
												response.sendRedirect("PendingProblems1.jsp");
												
	
											}
											
											
									%>
</body>
</html>
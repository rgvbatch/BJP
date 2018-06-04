<%@page import="com.java.dao.ConnectionSteps"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	response.setHeader("Cache-Control", "no-cache"); 
	response.setHeader("Cache-Control", "no-store"); 
	response.setDateHeader("Expires", 0); 
	response.setHeader("Pragma", "no-cache");
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String[] id = request.getParameterValues("check");
		//out.print(id.length);
	%>

	<%
		try {
			ConnectionSteps steps = new ConnectionSteps();
			Connection conn = steps.connection();
			for (int a = 0; a < id.length; a++) {

				PreparedStatement pstmt2 = conn.prepareStatement("DELETE  FROM problemtable where constitution=?");
				pstmt2.setString(1, id[a]);
				int l2 = pstmt2.executeUpdate();

				PreparedStatement pstmt = conn.prepareStatement("DELETE  FROM divisiontable where constitution=?");
				pstmt.setString(1, id[a]);
				int l = pstmt.executeUpdate();

				PreparedStatement pstmt1 = conn.prepareStatement("DELETE  FROM constitutiontable where constitution=?");
				pstmt1.setString(1, id[a]);
				int l1 = pstmt1.executeUpdate();

			}

			response.sendRedirect("ViewConstitution.jsp");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login File</title>
</head>
<body>
	<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dxc", "root", "root");
		PreparedStatement stmt = conn.prepareStatement("select username from user where username=? and password=?");
		stmt.setString(1, username);
		stmt.setString(2, password);
		ResultSet rs = stmt.executeQuery();
		if (rs.next()) {
			out.println("Login success");
			conn.close();
			/* 			out.println("<html><body>");
				out.println("<a href='home.html'>Home</a>");
				out.println("</body></html>"); */
	%>
	<jsp:forward page="sucess.html" />
	<%
	} else {
	out.println("Login Failed!");
	/* 			out.println("<html><body>");
		out.println("<a href='home.html'>Home</a>");
		out.println("</body></html>"); */
	%>
	<jsp:forward page="error.html" />
	<%
	}

	} catch (ClassNotFoundException ex) {
	ex.printStackTrace();
	} catch (SQLException ex) {
	ex.printStackTrace();
	}
	%>
</body>
</html>
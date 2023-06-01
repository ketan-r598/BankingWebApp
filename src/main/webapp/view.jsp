<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Page</title>
</head>
<body>
	<h2>Here is the list of users and their accounts:</h2>
	<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dxc", "root", "root");

		PreparedStatement stmt1 = conn.prepareStatement("select * from user");
		PreparedStatement stmt2 = conn.prepareStatement("select * from account");
		/* 		stmt.setString(1, username);
		stmt.setString(2, password); */
		ResultSet rs1 = stmt1.executeQuery();
		ResultSet rs2 = stmt2.executeQuery();

		while (rs1.next() && rs2.next()) {
			/* out.println("Login success"); */
			/* 			out.println("<html><body>");
			out.println("<a href='home.html'>Home</a>");
			out.println("</body></html>"); */
			out.println("<h4>" + rs1.getString("username") + " " + rs1.getString("password") + " "
			+ rs2.getString("accountid") + " " + rs2.getString("amount") + "" + "</h4>");
			/* 			out.print("<h4>"+ rs1.getString("password") +"</h4>");
				out.print("<h4>"+ rs2.getString("accountid") +"</h4>");
				out.print("<h4>"+ rs2.getString("amount") +"</h4>"); */
			out.println();
			conn.close();
		}
	} catch (ClassNotFoundException ex) {
		ex.printStackTrace();
	} catch (SQLException ex) {
		ex.printStackTrace();
	} finally {
		out.println("<h3>Go back to the <a href=\"home.html\">Home</a> page</h3>");
	}
	%>
</body>
</html>
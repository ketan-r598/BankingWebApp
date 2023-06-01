<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Success File</title>
</head>
<body>
	<%
	String accountid = request.getParameter("accountid");
	String amount = request.getParameter("amount");
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dxc", "root", "root");
		PreparedStatement stmt = conn.prepareStatement("insert into account values(?,?)");
		stmt.setString(1, accountid);
		stmt.setString(2, amount);
		int i = stmt.executeUpdate();
		if (i > 0) {
			out.println("<h3>Saved into database</h3>");
			/* out.println("<h3>Go back to the <a href=\"home.html\">Home</a> page</h3>"); */
			/* 			out.println("<html><body>");
		out.println("<a href='home.html'>Home</a>");
		out.println("</body></html>"); */
	%>
	<jsp:forward page="view.jsp" />
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
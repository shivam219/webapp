<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page isErrorPage="true"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String fname = request.getAttribute("fname").toString();
	String lname = request.getAttribute("lname").toString();
	String age1 = request.getAttribute("age").toString();
	int age = Integer.parseInt(age1);
	String phone1 = request.getAttribute("phone").toString();
	int phone = Integer.parseInt(phone1);
	String pass = request.getAttribute("pass").toString();
	%>
	<!-- script tag can use request object not allow method declaration-->

	<%="First Name : " + fname%>
	<br>
	<%="Last Name : " + lname%>
	<br>
	<%="Age : " + age%>
	<br>
	<%="Phone : " + phone%>
	<br>
	<%="Password : " + pass%>
	<br>
	<!-- express  tag  can't use request object-->
	<%
	Connection con = null;
	PreparedStatement pst = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con =DriverManager.getConnection("jdbc:mysql://localhost:3306/world","root", "Mysql111");
		pst = con.prepareStatement("insert into user values(?,? ,?,?,?)");
		pst.setString(1, fname);
		pst.setString(2, lname);
		pst.setInt(3, age);
		pst.setInt(4, phone);
		pst.setString(5, pass);
		int i = pst.executeUpdate();
		if (i > 0) {
		%> <script type="text/javascript">alert("data inserted successfully")</script>
			<%		
	 }
	} catch (Exception e) {

	}
	%>

	<%!%>
	<!-- declaration tag  can't use request object declare member and function-->

	<%=exception%>
	<!-- enable by set isrrorpage is true -->
</body>
</html>
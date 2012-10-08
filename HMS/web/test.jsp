<%@ page contentType="text/html; charset=iso-8859-1" language="java"
import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body><h1>GDtest
</h1>
<% String url = "jdbc:mysql://localhost:3306/hms";
String user= "root";
String pass= "123456";
try{
Class.forName ("com.mysql.jdbc.Driver").newInstance ();
Connection conn = DriverManager.getConnection(url, user, pass);
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("select * from accounts");

 
%>
<table border="1">
    <%
while(rs.next())
{
%>
 <tr>
<td><%= rs.getString("uname") %></td>
<td><%= rs.getString("passwd") %></td>
<td><%= rs.getString("type")%></td>
</tr>
<%}
rs.close();
conn.close();
}catch(Exception e)
{
out.println(e.toString());
}
%>
</table>
</body>
</html>
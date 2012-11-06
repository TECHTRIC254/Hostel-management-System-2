<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<% 
String url = "jdbc:mysql://localhost:3306/hms";
String user= "root";
String pass= "123456";
try{
Class.forName ("com.mysql.jdbc.Driver").newInstance ();
Connection conn = DriverManager.getConnection(url, user, pass);
Statement stmt = conn.createStatement();
String uname=request.getParameter("username");
String passwd=request.getParameter("password");
String query="select * from accounts where uname='"+uname+"' and passwd='"+passwd+"'";
ResultSet rs = stmt.executeQuery(query);
rs.close();
conn.close();
}catch(Exception e)
{
out.println(e.toString());
}
%>
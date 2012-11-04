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
String query="select count(*) from Hall";
ResultSet rs = stmt.executeQuery(query);
int count=0;
while(rs.next()){
    count=rs.getInt(1);
}
out.println(count);
    
}catch(Exception e)
{
out.println(e.toString());
}%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="stylesheet/style.css" />
</head>
    <div class="heading">Hall of Students Residence Statistics</div>
</html>

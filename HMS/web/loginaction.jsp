<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Checking Login</title>
</head>
<body>
<% String url = "jdbc:mysql://localhost:3306/hms";
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
rs.next();
//out.println(rs.getRow());
if(rs.getRow()==1)
{
    if(rs.getInt(3)==0){
    %>
    <%@ include file="admin.jsp" %>
    <%}
       else if(rs.getInt(3)==1){
    %>
    <%@ include file="hall.jsp" %>
    <%}
    else{
    %>
    <%@ include file="hostel.jsp" %>
    <%}
    
}
    
else
{
    %>
    <%@ include file="banner.jsp" %>
    <center><font color="red">Login failed</font></center>
    <%@ include file="login.jsp" %>
    <%
}
rs.close();
conn.close();
}catch(Exception e)
{
out.println(e.toString());
}
%>
</body>
</html>
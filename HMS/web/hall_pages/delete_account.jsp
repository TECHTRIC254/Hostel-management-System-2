<%-- 
    Document   : modify_hall
    Created on : 7 Nov, 2012, 2:37:44 PM
    Author     : niyasc
--%>
<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <%
    //out.println(request.getParameter("name"))
    String url = "jdbc:mysql://localhost:3306/hms";
    String user= "root";
    String pass= "123456";
    try{
    Class.forName ("com.mysql.jdbc.Driver").newInstance ();
Connection conn = DriverManager.getConnection(url, user, pass);
Statement stmt = conn.createStatement();
String query="delete from accounts where uname='"+request.getParameter("uname")+"'";
stmt.executeUpdate(query);
conn.close();
    %>
    <jsp:forward page="hostel_accounts.jsp" >
    <jsp:param name="message" value="Account deleted Successfully" />
    <jsp:param name="type" value="success"/>
    </jsp:forward>
    <%
}catch(Exception e)
{
out.println(e.toString());
}
    %>

</html>

<%-- 
    Document   : view_hall
    Created on : Nov 10, 2012, 1:14:21 AM
    Author     : niyasc
--%>
<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<% String id=request.getParameter("id");%>
<% 
String url = "jdbc:mysql://localhost:3306/hms";
String user= "root";
String pass= "123456";
Class.forName ("com.mysql.jdbc.Driver").newInstance ();
Connection conn = DriverManager.getConnection(url, user, pass);
Statement stmt = conn.createStatement();
String query="select * from Hall where hid="+id;
ResultSet rs = stmt.executeQuery(query);
rs.next();

%>
<h3 style="text-align: center"> Enter new values </h3>
<%
if(request.getParameter("message")!=null){
    out.println("<div class='warning' >"+request.getParameter("message")+"</div>");
}
else{
    out.println("</br>");
}
%>
<form action="modify_hall.jsp">
<table style="text-align: center">
    <%
    out.println("<tr><td>Hall ID</tr></td>");
    out.println("<tr><td><input type=text value='"+rs.getInt("hid")+"' name='id' readonly/>");
    out.println("<tr><td>Hall Name</tr></td>");
    out.println("<tr><td><input type=text value='"+rs.getString("name")+"' name='name' required/>");
    out.println("<tr><td>Provost</tr></td>");
    out.println("<tr><td><input type=text value='"+rs.getString("provost")+"' name='provost' required/>");
    out.println("<tr><td>Number of Hostels</tr></td>");
    out.println("<tr><td><input type=text value='"+rs.getInt(3)+"' name='' readonly/>");
    %>
    <tr>
        <td><input type="submit" value="Update"/></td>
    </tr>
</table>
</form>
</html>

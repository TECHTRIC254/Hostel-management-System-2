<%-- 
    Document   : hall_info
    Created on : 6 Nov, 2012, 11:45:48 PM
    Author     : niyasc
--%>

<%@ page contentType="text/html" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
  <div class="heading">List of Halls<br/></div>  
<% 
String url = "jdbc:mysql://localhost:3306/hms";
String user= "root";
String pass= "123456";
try{
Class.forName ("com.mysql.jdbc.Driver").newInstance ();
Connection conn = DriverManager.getConnection(url, user, pass);
Statement stmt = conn.createStatement();
String query="select * from Hall";
ResultSet rs = stmt.executeQuery(query);
%>
<table border="1">
    <thead>
    <tr>
    <th>Hall ID</th>
    <th>Name</th>
    <th>Number of Employees</th>
    <th>Number of Hostels</th>
    </tr>
    </thead>
    <%
    int i=0;
    while(rs.next()){
        out.println("<form method='POST' action='delete_hall.jsp'>");
        out.println("<form method='POST' action='modify_hall.jsp'");
        out.println("<tr>");
        out.println("<td>"+rs.getInt(1)+"</td>");
        //out.println("<td>"+rs.getString("name")+"</td>");
        out.println("<td><input type='text' value='"+rs.getString("name")+"' name='"+i+"' ></td>");
        %>
        
        <%
        out.println("<td>"+rs.getInt(3)+"</td>");
        out.println("<td>"+rs.getInt(4)+"</td>");
        out.println("<td><input type='submit' value='Update'/></td>");
        out.println("</form>");
        out.println("<td><input type='submit' value='Delete'/></td>");
        out.println("</form>");
        out.println("</tr>");
        
        i++;
               }
out.println("<br/>");
%>
</table>
<%
rs.close();
conn.close();
}catch(Exception e)
{
out.println(e.toString());
}
%>

</html>

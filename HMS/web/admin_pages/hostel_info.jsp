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
    <div class="heading">List of Hostels<br/></div>
<% 
String url = "jdbc:mysql://localhost:3306/hms";
String user= "root";
String pass= "123456";
try{
Class.forName ("com.mysql.jdbc.Driver").newInstance ();
Connection conn = DriverManager.getConnection(url, user, pass);
Statement stmt = conn.createStatement();
String query="select a.hid,a.name,a.capacity,a.no_of_rooms,a.no_of_emp,a.mess_contractor,"
 + "a.mess_capacity,b.name from Hostel a,Hall b where b.hid in(select Hall_id from hostel_hall"
 + " where Hostel_id=a.hid)";
ResultSet rs = stmt.executeQuery(query);
out.println("<br/>");
%>
<table border="1">
    <thead>
    <tr>
    <th>Hostel ID</th>
    <th>Name</th>
    <th>Capacity</th>
    <th>Number of Rooms</th>
    <th>Number of Employees</th>
    <th>Mess Contractor</th>
    <th>Mess Capacity</th>
    <th>Hall Name</th>
    </tr>
    </thead>
    <%
    while(rs.next()){
        out.println("<tr>");
        out.println("<td>"+rs.getInt(1)+"</td>");
        out.println("<td>"+rs.getString("a.name")+"</td>");
        out.println("<td>"+rs.getInt(3)+"</td>");
        out.println("<td>"+rs.getInt(5)+"</td>");
        out.println("<td>"+rs.getInt(4)+"</td>");
        out.println("<td>"+rs.getString("a.mess_contractor")+"</td>");
        
        out.println("<td>"+rs.getInt(7)+"</td>");
        out.println("<td>"+rs.getString("b.name")+"</td>");
        out.println("</tr>");
               }
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

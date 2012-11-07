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
<table class="table_style">
    <tr>
    <td>Hostel ID</td>
    <td>Name</td>
    <td>Capacity</td>
    <td>Number of Rooms</td>
    <td>Number of Employees</td>
    <td>Mess Contractor</td>
    <td>Mess Capacity</td>
    <td>Hall Name</td>
    </tr>
    <%
    int i=0;
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
        i=i+1;
               }
    if(i==0){
        %>
        <tr>
            <td>No records found.</td>
        </tr>
        <%
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

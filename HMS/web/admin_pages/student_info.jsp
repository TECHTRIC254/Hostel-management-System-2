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
    <div class="heading">List of Students<br/></div>
    
<% 
String url = "jdbc:mysql://localhost:3306/hms";
String user= "root";
String pass= "123456";
try{
Class.forName ("com.mysql.jdbc.Driver").newInstance ();
Connection conn = DriverManager.getConnection(url, user, pass);
Statement stmt = conn.createStatement();
String query="select a.sid,a.name,a.course,a.dept,a.year,a.city,a.state,a.phone,b.room_no,"
 + "c.name from Student a,student_hostel b,Hostel c where b.student_id=a.sid "
 + "and c.hid=(select hostel_id from student_hostel where student_id=a.sid)";
ResultSet rs = stmt.executeQuery(query);
%>
<table border="1">
    <thead>
    <tr>
    <th>Student ID</th>
    <th>Name</th>
    <th>Course</th>
    <th>Department</th>
    <th>Year</th>
    <th>City</th>
    <th>State</th>
    <th>Phone</th>
    <th>Room No.</th>
    <th>Hostel</th>
    </tr>
    </thead>
    <%
    while(rs.next()){
        out.println("<tr>");
        out.println("<td>"+rs.getInt(1)+"</td>");
        out.println("<td>"+rs.getString("a.name")+"</td>");
        out.println("<td>"+rs.getString("a.course")+"</td>");
        out.println("<td>"+rs.getString("a.dept")+"</td>");
        out.println("<td>"+rs.getInt(5)+"</td>");
        out.println("<td>"+rs.getString("a.city")+"</td>");
        out.println("<td>"+rs.getString("a.state")+"</td>");
        out.println("<td>"+rs.getInt(8)+"</td>");
        out.println("<td>"+rs.getInt(9)+"</td>");
        out.println("<td>"+rs.getString("c.name")+"</td>");
        //out.println("<td>"+rs.getInt(3)+"</td>");
        //out.println("<td>"+rs.getInt(5)+"</td>");
        //out.println("<td>"+rs.getInt(4)+"</td>");
        //out.println("<td>"+rs.getString("a.mess_contractor")+"</td>");
        
        //out.println("<td>"+rs.getInt(7)+"</td>");
        //out.println("<td>"+rs.getString("b.name")+"</td>");
        out.println("</tr>");
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

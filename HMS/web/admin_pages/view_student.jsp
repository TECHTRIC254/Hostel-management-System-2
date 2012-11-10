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
String query="select a.sid,a.name,a.course,a.dept,a.year,a.city,a.state,a.phone,b.room_no,"
 + "c.name from Student a,student_hostel b,Hostel c where b.student_id=a.sid "
 + "and c.hid=(select hostel_id from student_hostel where student_id=a.sid) and a.sid="+request.getParameter("id");
ResultSet rs = stmt.executeQuery(query);
rs.next();
%>
<h3 style="text-align: center">Student Information</h3>
<table style="text-align: center;margin-left: auto;margin-right: auto">
    <tr>
        <td>
            Student ID
        </td>
    <%out.println("<tr><td><input type=text value='"+rs.getInt("a.sid")+"' readonly/></tr></td>");%>
    <tr>
        <td>
            Name
        </td>
    </tr>
    <%out.println("<tr><td><input type=text value='"+rs.getString("a.name")+"' readonly/></tr></td>");%>
    <tr>
        <td>
            Course
        </td>
    </tr>
    <%out.println("<tr><td><input type=text value='"+rs.getString("a.course")+"' readonly/></tr></td>");%>
    <tr>
        <td>
            Department
        </td>
    </tr>
    <%out.println("<tr><td><input type=text value='"+rs.getString("a.dept")+"' readonly/></tr></td>");%>
    
    <tr>
        <td>
            Year
        </td>
    </tr>
    <%out.println("<tr><td><input type=text value='"+rs.getInt("a.year")+"' readonly/></tr></td>");%>
    <tr>
        <td>
            City
        </td>
    </tr>
    <%out.println("<tr><td><input type=text value='"+rs.getString("a.city")+"' readonly/></tr></td>");%>
    <tr>
        <td>
            State
        </td>
    </tr>
    <%out.println("<tr><td><input type=text value='"+rs.getString("a.state")+"' readonly/></tr></td>");%>
    <tr>
        <td>
            Phone
        </td>
    </tr>
    <%out.println("<tr><td><input type=text value='"+rs.getInt("a.phone")+"' readonly/></tr></td>");%>
    <tr>
        <td>
            Room Number
        </td>
    </tr>
    <%out.println("<tr><td><input type=text value='"+rs.getString("b.room_no")+"' readonly/></tr></td>");%>
        <tr>
        <td>
            Hostel
        </td>
    </tr>
    <%out.println("<tr><td><input type=text value='"+rs.getString("c.name")+"' readonly/></tr></td>");%>
    <form action="student_info.jsp">
        <tr><td> <input type="submit" value='Go back'/></td></tr>
    </form>
    
</table>
<%
out.println("<br/>");
rs.close();
conn.close();
}catch(Exception e)
{
out.println(e.toString());
}
%>
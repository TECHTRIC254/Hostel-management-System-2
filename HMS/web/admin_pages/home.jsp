<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
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
String uname=request.getParameter("username");
String passwd=request.getParameter("password");
//Number of Halls
String query="select count(*) from Hall";
ResultSet rs = stmt.executeQuery(query);
rs.next();
int hall=rs.getInt(1);
//Number of Hostels
query="select count(*) from Hostel";
rs=stmt.executeQuery(query);
rs.next();
int hostel=rs.getInt(1);
//Number of students Admitted
query="select count(*) from Student";
rs=stmt.executeQuery(query);
rs.next();
int student=rs.getInt(1);
%>
<br/>
<table class="table_style">
    <tr>
        <td>Hall of Students Residence Overview</td>
    </tr>
    <tr>
        <td>Number of Halls</td>
        <td><%=hall%></td>
    </tr>
    <tr>
        <td>Number of Hostels</td>
        <td><%=hostel%></td>
    </tr>
    <tr>
        <td>Number of Students</td>
        <td><%=student%></td>
    </tr>
</table>
<%
    
}
catch(Exception e)
{
out.println(e.toString());
}%>


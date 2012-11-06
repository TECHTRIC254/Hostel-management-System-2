<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<head>
    <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<div class="heading">Hall of Students Residence Statistics</div>   
<%

                       if(request.getParameter("message")!=null){
                       out.println("<div class='signoff'>"+request.getParameter("message")+"</div>");
                                             }
                                             else{
                           out.println("<br/>");
                                             }%>
                                          
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
//Number of employees
query="select count(*) from Employee";
rs=stmt.executeQuery(query);
rs.next();
int employee=rs.getInt(1);
%>
<table border="1" style="margin-top: 10" class="table">
    <tr>
        <td>Number of Halls</td>
        <td>:</td>
        <td><%=hall%></td>
    </tr>
    <tr>
        <td>Number of Hostels</td>
        <td>:</td>
        <td><%=hostel%></td>
    </tr>
    <tr>
        <td>Number of Students</td>
        <td>:</td>
        <td><%=student%></td>
    </tr>
    <tr>
        <td>Number of Employees</td>
        <td>:</td>
        <td><%=employee%></td>
    </tr>
</table>
<%
    
}
catch(Exception e)
{
out.println(e.toString());
}%>


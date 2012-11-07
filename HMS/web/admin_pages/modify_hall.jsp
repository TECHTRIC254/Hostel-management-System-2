
<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <%
    String name=request.getParameter("name");
    if(name==null||name.equals("")){
    %>
<jsp:forward page="hall_info.jsp" >
  <jsp:param name="message" value="Name field can not be left blank" />
  <jsp:param name="type" value="error"/>
</jsp:forward><%
}
else if(name.indexOf(34)!=-1||name.indexOf(39)!=-1) {
    %>
    
<jsp:forward page="hall_info.jsp" >
  <jsp:param name="message" value="Name should not contain single or double quotes" />
  <jsp:param name="type" value="error"/>
</jsp:forward>
    <%
}
    //out.println(request.getParameter("id"));
String url = "jdbc:mysql://localhost:3306/hms";
String user= "root";
String pass= "123456";
Class.forName ("com.mysql.jdbc.Driver").newInstance ();
Connection conn = DriverManager.getConnection(url, user, pass);
Statement stmt = conn.createStatement();
String query="select * from Hall where name='"+name+"' and hid!="+request.getParameter("id");
ResultSet rs = stmt.executeQuery(query);
rs.next();
if(rs.getRow()==1)
       {
    rs.close();
    conn.close();%>
<jsp:forward page="hall_info.jsp" >
  <jsp:param name="message" value="Hall name already exist" />
  <jsp:param name="type" value="error"/>
</jsp:forward><%
       }
try{
query="update Hall set name='"+name+"' where hid="+request.getParameter("id");
stmt.executeUpdate(query);
conn.close();%>
<jsp:forward page="hall_info.jsp" >
  <jsp:param name="message" value="Hall name updated Successfully" />
  <jsp:param name="type" value="success"/>
</jsp:forward>
<%
}catch(Exception e)
{
out.println(e.toString());
}
    %>

</html>

<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<%
String url = "jdbc:mysql://localhost:3306/hms";
String user= "root";
String pass= "123456";
if(request.getParameter("name")==null||request.getParameter("name").equals("")){
    %>
<jsp:forward page="create_account.jsp" >
  <jsp:param name="message" value="Name field can not be left blank" />
</jsp:forward><%
}
else if(request.getParameter("name").indexOf(34)!=-1||request.getParameter("name").indexOf(39)!=-1) {
    %>
    
<jsp:forward page="create_account.jsp" >
  <jsp:param name="message" value="Name should not contain single or double quotes" />
</jsp:forward>
    <%

}
else if(request.getParameter("hostel").equals("None")) {
    %>
    
<jsp:forward page="create_account.jsp" >
  <jsp:param name="message" value="Select a Hostel and try again" />
</jsp:forward>
    <%

}
else if(request.getParameter("password1").equals(request.getParameter("password2"))==false) {
    %>
    
<jsp:forward page="create_account.jsp" >
  <jsp:param name="message" value="Passwords do not match" />
</jsp:forward>
    <%

}
try{
Class.forName ("com.mysql.jdbc.Driver").newInstance ();
Connection conn = DriverManager.getConnection(url, user, pass);
Statement stmt = conn.createStatement();
out.println(request.getParameter("name"));
String query="select count(*) from accounts where uname='"+request.getParameter("name")+"'";
ResultSet rs = stmt.executeQuery(query);
rs.next();

if(rs.getInt(1)==1)
{
    rs.close();
    conn.close();%>
<jsp:forward page="create_account.jsp" >
  <jsp:param name="message" value="Username already exist" />
</jsp:forward><%
}
    query="select hid from Hostel where name='"+request.getParameter("hostel")+"'";
    rs=stmt.executeQuery(query);
    rs.next();
    int h_no=rs.getInt(1);

    query="insert into accounts values('"+request.getParameter("name")+"','"+request.getParameter("password1")+"',2,"+h_no+")";
    stmt.executeUpdate(query);

conn.close();
response.sendRedirect("hostel_accounts.jsp?message=Account+created+Succesfully&type=success");
}catch(Exception e)
{
out.println(e.toString());
}

%>
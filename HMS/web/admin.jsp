<%-- 
    Document   : admin
    Created on : 8 Oct, 2012, 11:48:13 PM
    Author     : niyasc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin User</title>

    <%
    if(session.getAttribute("username")==null)
           {%>
           <%@ include file="banner.jsp"%>
           <center> <font color="red">Please Login First</font></center>
           <%@ include file="login.jsp"%>
    <%
       }
    else
    {
    %>
           Welcome <%=session.getAttribute("username")%>
           <a href="logout.jsp">logout</a>
    <%
    }
    %>
   
</html>
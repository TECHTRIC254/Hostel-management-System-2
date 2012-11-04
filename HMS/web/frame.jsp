<%@ page language="java" errorPage="notFound.jsp" %>
<%
String block=request.getParameter("page");

    try{
    out.println("<iframe src ="+block+" width=800 height=400>");
    out.println("<p>Your browser does not support iframes.</p>");
    out.println("</iframe>");
    }
    catch(Exception e){
                             out.println("Requested file not found");
                   
       }
%>



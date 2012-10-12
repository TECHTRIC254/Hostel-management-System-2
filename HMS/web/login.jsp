<%-- 
    Document   : login
    Created on : 8 Oct, 2012, 11:52:28 PM
    Author     : niyasc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <center>
        <form method="GET" action="loginaction.jsp">
        <table>
            <tr>
                <td>User name:</td>
                <td>:</td>
                <td><input type="text" name="username"/></td>
            </tr>
            <tr>
                <td>Password</td>
                <td>:</td>
                <td><input type="password" name="password"/></td>
                
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td><input type="submit" value="login"/></td>
            </tr>
        </table>
    </form>
    </center>
</html>

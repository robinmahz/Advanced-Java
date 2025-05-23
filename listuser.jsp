<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ page import="com.helper.*,java.sql.*" %>
<%
	String msg=request.getParameter("msg");
	if(null!=msg){
%>
<font color="red"><%=msg %></font>
<%
	}
%>
<h1>List Of users</h1>
<table>
<tr>
    <th>Id</th>
    <th>Name</th>
    <th>Email</th>
    <th>Action</th>
</tr>
<%
// get all users
String sql = "SELECT * FROM users";
String error = "";
Connection con = null;

try {
    con = ConnectionHelper.getConnection(); // static method
    PreparedStatement pre = con.prepareStatement(sql);
	ResultSet rs = pre.executeQuery();
    while (rs.next()) {
%>
<tr>
    <td><%=rs.getInt("id")%></td>
    <td><%=rs.getString("name")%></td>
    <td><%=rs.getString("email")%></td>
    <td>
        <a href="deleteuser.jsp?id=<%=rs.getInt("id")%>">Delete</a>
        <a href="updateuser.jsp?id=<%=rs.getInt("id")%>">Update</a>
    </td>
</tr>
<%
    }
    pre.close();
} catch(Exception e){
    e.printStackTrace();
    error = e.getMessage();
} finally {
    if (con != null) {
        try {
            con.close();
        } catch (SQLException e) {
            out.println("Error closing connection: " + e.getMessage());
        }
    }
}

%>
</table>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ page import="com.helper.*,java.sql.*" %>
<%
String id=request.getParameter("id");


// Check if the user is already logged in 
String sql = "DELETE FROM users WHERE id=?;";
String error = "";
String msg = "";
Connection con = null;
boolean deleted = false; 

try {
    con = ConnectionHelper.getConnection(); // static method
    PreparedStatement pre = con.prepareStatement(sql);
    pre.setString(1, id);
    int rowsAffected = pre.executeUpdate();
    if (rowsAffected > 0) {
        msg = "User deleted successfully";
        deleted = true;
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

if(deleted) {
		response.sendRedirect("listuser.jsp?msg="+msg);
	} else {
		response.sendRedirect("listuser.jsp?msg=error occured while deleting");
	}
%>
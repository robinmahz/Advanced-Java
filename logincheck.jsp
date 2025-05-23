<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ page import="com.helper.*,java.sql.*" %>
<%
	String name=request.getParameter("name");
	String password=request.getParameter("password");
	String remember = request.getParameter("remember");

	//set cookie if remember is checked
	if(null != remember) {
		Cookie cookie = new Cookie("name", name);
		response.addCookie(cookie);
	}else {
		Cookie cookie = new Cookie("name", null);
		response.addCookie(cookie);
	}

// Check if the user is already logged in 
String sql = "SELECT * FROM users WHERE name=? AND password=?";
String error = "";
Connection con = null;
boolean isValidUser = false;

try {
    con = ConnectionHelper.getConnection(); // static method
    PreparedStatement pre = con.prepareStatement(sql);
    pre.setString(1, name);
    pre.setString(2, password);
	ResultSet rs = pre.executeQuery();
	if (rs.next()) {
		isValidUser = true;
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


	if(isValidUser) {
		session.setAttribute("NAME", name);
		response.sendRedirect("home.jsp");
	} else {
		response.sendRedirect("index.jsp?msg=Invalid Login");
	}
%>
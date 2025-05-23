<%@ page import="com.helper.*,java.sql.*" %>
<%
String name = request.getParameter("name");
String password = request.getParameter("password");
String email = request.getParameter("email");
String address = request.getParameter("address");

String sql = "INSERT INTO users (name, password, email, address) VALUES (?, ?, ?, ?)";
String error = "";
Connection con = null;

try {
    con = ConnectionHelper.getConnection(); // static method
    PreparedStatement pre = con.prepareStatement(sql);
    pre.setString(1, name);
    pre.setString(2, password);
    pre.setString(3, email);
    pre.setString(4, address);
    pre.execute();
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

if (error.isEmpty()) {
    out.println("✅ User registered successfully");
} else {
    out.println("❌ Error: " + error);
}
%>

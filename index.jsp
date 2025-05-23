<%-- login page --%>


<%-- java page directive  --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
	String msg=request.getParameter("msg");
	if(null!=msg){
%>
<font color="red"><%=msg %></font>
<%
	}
%>

<% 
	String name = "";
	Cookie[] cookies = request.getCookies();
  String checked = "";
	for(Cookie c:cookies){
		if(c.getName().equals("name") && c.getValue() != null){
			name = c.getValue();
      checked = "checked";
			break;
		}
	}

%>


<html>
  <head>
    <title>My JSP Page</title>
  </head>
  <body>
    <h1>Login</h1>

    <form class="max-w-sm mx-auto" method="post" action="logincheck.jsp">
      <div class="mb-5">
        <label
          class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
          >Your name</label
        >
        <input
          name="name"
          type="text"
          value="<%=name %>"
          required
        />
      </div>
      <div class="mb-5">
        <label
          for="password"
          class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
          >Your password</label
        >
        <input
          name="password"
          type="password"
          id="password"
          required
        />
      </div>
      <div class="mb-5">
        <label class="flex items-center">
          <input
            type="checkbox"
            name="remember"
            id="remember"
            <%=checked %>
          />
          <span >Remember Me</span>
        </label>
      </div>
      <button type="submit">
        Submit
      </button>
      <a href="register.jsp">Register</a>
    </form>
  </body>
</html>
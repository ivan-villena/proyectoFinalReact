
<%@ page import="java.util.*" session="true" %>

<%	
	HttpSession sesion = request.getSession();

	sesion.removeAttribute("usuario");

	response.sendRedirect("../index.jsp");
%>
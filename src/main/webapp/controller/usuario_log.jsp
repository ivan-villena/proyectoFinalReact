
<%@ page import="dao.UsuarioDAO" %>

<%@ page import="model.Usuario" %>

<%@ page import="java.util.*" session="true" %>

<%	
	String email  	= request.getParameter("email");
	String password = request.getParameter("password");
	
	if( UsuarioDAO.validar( email, password ) ){
		
		Usuario usuario = UsuarioDAO.ver("email = '" + email + "'"); 
		
		HttpSession sesion = request.getSession();
		
		sesion.setAttribute("usuario", usuario);
		
		response.sendRedirect("../view/usuario_main.jsp");
		
	}else{
		
		response.sendRedirect("../view/usuario_log.jsp?error=El usuario o la contraseña son incorrectos...");
		
	}
%>


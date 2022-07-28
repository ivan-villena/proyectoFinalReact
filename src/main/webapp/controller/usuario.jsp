
<%@ page import="dao.UsuarioDAO" %>

<%@ page import="model.Usuario" %>

<%@ page import="java.util.*" session="true" %>

<%		

	Integer id				= request.getParameter("id") != null ? Integer.valueOf( request.getParameter("id") ) : 0;
	String categoria  = request.getParameter("categoria");
	String nombre 		= request.getParameter("nombre");
	String apellido 	= request.getParameter("apellido");
	String email  		= request.getParameter("email");
	String password 	= request.getParameter("password");
	Boolean es_admin 	= request.getParameter("es_admin") == "1";
	Integer telefono 	= request.getParameter("telefono") != null ? Integer.valueOf(request.getParameter("telefono")) : 0;
	
	// validaciones
	String mensaje = "";
	Boolean error_interno = false;
	
	// flujos de navgeacion
	HttpSession sesion = request.getSession();
	String last_page = sesion.getAttribute("last_page") != null ? (String)sesion.getAttribute("last_page") : "index.jsp";
	
	// modo alta:
	if( id == 0 ){
		mensaje = "Hubo un error al registrar el usuario...";
		// que no exista otro usuario con el mismo mail	
		if( UsuarioDAO.ver("email") != null ){
			mensaje = "Ya existe un usuario registrado con este e-mail: " + email;
			error_interno = true;
		}			
	}else{
		mensaje = "Hubo un error al actualizar el usuario...";
	}
	
	// proceso errores
	if( error_interno ){
		
		response.sendRedirect("../view/mensaje.jsp?error="+mensaje);
	}
	else{
		// ejecuto proceso		
		try{
			
			Usuario usuario = new Usuario( id, categoria, nombre, apellido, email, password, es_admin, telefono );
			
			Integer ok = ( id == 0 ) ? UsuarioDAO.agregar( usuario ) : UsuarioDAO.modificar( usuario );		
			
			if( ok > 0 ) {
				
				if( id > 0 ){
										
					response.sendRedirect( "../" + last_page );
				}
				else{
					
					response.sendRedirect("usuario_log.jsp?email="+usuario.getEmail()+"&password="+usuario.getPassword());				
				}			
			}
			else {
				response.sendRedirect("../view/mensaje.jsp?error="+mensaje);
			}

		}catch(Exception e){
			
			response.sendRedirect("../view/mensaje.jsp?error="+mensaje);
		}		
	}

%>

<%@ page import="dao.UsuarioDAO" %>

<%@ page import="model.Usuario" %>

<%		

	Integer id = request.getParameter("id") != null ? Integer.valueOf( request.getParameter("id") ) : 0;

	Integer es_admin = request.getParameter("es_admin") != null ? Integer.valueOf( request.getParameter("es_admin") ) : 0;

	out.println( es_admin );

	if( id > 0 ){
		
		Usuario usuario = UsuarioDAO.ver( "id = " + id );				
		
		if( usuario != null ){
			
			usuario.setEs_admin( es_admin > 0 );
			
			Integer ok = UsuarioDAO.modificar(usuario);			
		}		
	}
	response.sendRedirect("../view/admin_usuario.jsp");
%>
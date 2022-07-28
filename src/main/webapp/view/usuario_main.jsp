
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="dao.TiketDAO" %>

<%@ page import="dao.CharlaDAO" %>

<%@ page import="model.Usuario" %>

<%@ page import="java.util.*" session="true" %>

<% // objeto sesion
	HttpSession sesion = request.getSession();
	Usuario usuario = sesion.getAttribute("usuario") != null ? (Usuario)sesion.getAttribute("usuario") : null;
	// flujos de navegación
	session.setAttribute("last_page","view/usuario_main.jsp");
%>

<!DOCTYPE html>

<html lang="es">

<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
  <link rel="stylesheet" href="../css/main.css">
  
  <title>Conf. B.A. - Cuenta de Usuario</title>

</head>

<body>
     
  <header>
    
    <nav id="app_menu" class="navbar navbar-expand-lg navbar-dark px-2 fondo-gris">

      <div class="container-fluid">

        <div>
          <img src="../ima/codoacodo.png" alt="logotipo" class="img-fluid" width="100">
          <a class="navbar-brand" href="../index.jsp">Conf. Bs. As.</a>
        </div>
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">        
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
        
          <ul class="navbar-nav">
            <% if( usuario.getEs_admin() ){ %>
		     		<li class="nav-item">
		     			<a class='nav-link' href='admin.jsp'>Administrador del Sistema</a>
		    		</li>        		
			      <% } %>
            <li class="nav-item">
              <a class="nav-link" href="usuario_tiket.jsp">Ver Tikets</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="tiket.jsp">Comprar Tikets</a>
            </li>            
            <li class="nav-item">
              <a class="nav-link" href="usuario_charla.jsp">Ver Charlas</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="../index.jsp#nav-ser_orador">Nueva Charla</a>
            </li>
            <li class="nav-item">
         			<a class='nav-link' href='../controller/usuario_out.jsp'>Cerrar Sesión</a>
            </li>            
          </ul>
          
        </div>        

      </div>
              
    </nav>
    
  </header>

	<main>
	
		<h1>Cuenta de Usuario</h1>
		
		<p>Hola <% out.println(usuario.getNombre());%></p>
		
		<div class="card-group">
					
			<div class="card text-dark bg-light mb-3 mx-2" style="max-width: 18rem;">
			
			  <div class="card-header">
			  	<b>Tikets</b>
			  </div>
			  
			  <div class="card-body">
			    
			    <p class="card-text">Has realizado <% out.print( TiketDAO.contar("email='"+usuario.getEmail()+"'") ); %> compras por un total de <% out.print( TiketDAO.sumar("cantidad","email='"+usuario.getEmail()+"'") ); %> tikets que suman $<% out.print( TiketDAO.sumar("total","email='"+usuario.getEmail()+"'") ); %>.</p>
			    
			  </div>
			</div>
			
			<div class="card text-dark bg-light mb-3 mx-2" style="max-width: 18rem;">
			
			  <div class="card-header">
			  	<b>Charlas</b>
			  </div>
			  
			  <div class="card-body">
			    
			    <p class="card-text">Te has anotado en <% out.print( CharlaDAO.contar("usuario_id="+usuario.getId()) ); %> charlas.</p>
			    
			  </div>
			</div>					
			
		</div>
		
	</main>

  <!-- boostrap -->    
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <!-- iconos -->
  <script src="https://kit.fontawesome.com/75a87d5511.js" crossorigin="anonymous"></script>

</body>
</html>
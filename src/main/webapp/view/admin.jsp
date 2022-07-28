
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="dao.UsuarioDAO" %>

<%@ page import="dao.TiketDAO" %>

<%@ page import="dao.CharlaDAO" %>

<%@ page import="model.Usuario" %>

<%@ page import="model.Tiket" %>

<%@ page import="model.Charla" %>

<%@ page import="java.util.*" session="true" %>

<% // objeto sesion	
	HttpSession sesion = request.getSession();
	// flujos de navegación
	session.setAttribute("last_page","view/admin.jsp");
%>

<!DOCTYPE html>

<html lang="es">

<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
  <link rel="stylesheet" href="../css/main.css">
  
  <title>Administrador del Sistema</title>

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
            <li class="nav-item">
              <a class="nav-link" href="admin_usuario.jsp">Ver Usuarios</a>
            </li>          
            <li class="nav-item">
              <a class="nav-link" href="admin_tiket.jsp">Ver Tikets</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="admin_charla.jsp">Ver Charlas</a>
            </li>
            <li class="nav-item">
         			<a class='nav-link' href='usuario_main.jsp'>Salir del Administrador</a>
            </li>            
          </ul>
          
        </div>        

      </div>

    </nav>
    
  </header>

	<main>
	
		<h1>Administrador del Sistema</h1>
		
		<div class="card-group">
		
			<div class="card text-dark bg-light mb-3 mx-2" style="max-width: 18rem;">
			
			  <div class="card-header">
			  	<b>Usuarios del Sistema</b>
			  </div>
			  
			  <div class="card-body">			  			 
			    
			    <p class="card-text">Actualmente, hay <% out.print( UsuarioDAO.contar(null) ); %> Usuarios registrados.</p>
			    
			    <p class="card-text">A continuación se muestra un listado de totales por categoría:</p>
			    
					<ul class="list-group list-group-flush text-start">
						<li class="list-group-item"><% out.println( UsuarioDAO.contar("categoria = 'oyente'") ); %> Oyentes...</li>
						<li class="list-group-item"><% out.println( UsuarioDAO.contar("categoria = 'estudiante'") ); %> Estudiantes...</li>
						<li class="list-group-item"><% out.println( UsuarioDAO.contar("categoria = 'trainee'")); %> Trainees...</li>
						<li class="list-group-item"><% out.println( UsuarioDAO.contar("categoria = 'junior'") ); %> Juniors...</li>
					</ul>
					
					<p class="card-text">De los cuales <% out.print( UsuarioDAO.contar("es_admin = 1") ); %> son administradores.</p>
			    
			  </div>
			</div>
			
			<div class="card text-dark bg-light mb-3 mx-2" style="max-width: 18rem;">
			
			  <div class="card-header">
			  	<b>Resumen de Ventas</b>
			  </div>
			  
			  <div class="card-body">
			    
			    <p class="card-text">Se han realizado <% out.print( TiketDAO.contar(null) ); %> ventas.</p>
			    
			    <p class="card-text">La cantidad de Tikets es de <% out.print( TiketDAO.sumar("cantidad", null) ); %>, por un total de $<% out.print(TiketDAO.sumar("total", null) ); %></p>
			    
			  </div>
			</div>
			
			<div class="card text-dark bg-light mb-3 mx-2" style="max-width: 18rem;">
			
			  <div class="card-header">
			  	<b>Oradores</b>
			  </div>
			  
			  <div class="card-body">
			    
			    <p class="card-text">Se han registrado <% out.print( CharlaDAO.contar(null) ); %> charlas.</p>
			    
			    <p class="card-text">Hay <% out.print( CharlaDAO.contar_grupos(null,"usuario_id") ); %> usuarios que presentron al menos una charla.</p>
			    
			  </div>
			</div>					
			
		</div>
			
	</main>

  <!-- boostrap -->    
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>
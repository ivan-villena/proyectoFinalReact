
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="dao.UsuarioDAO" %>

<%@ page import="model.Usuario" %>

<%@ page import="java.util.*" session="true" %>

<%
	String mensaje = request.getParameter("mensaje");
	// modo modificar
	Integer id = request.getParameter("id") != null ? Integer.valueOf( request.getParameter("id") ) : 0;
	Usuario usuario = UsuarioDAO.ver("id = " + id);
%>

<!DOCTYPE html>

<html lang="es">

<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
  <link rel="stylesheet" href="../css/main.css">
  
  <title>Registro de Usuario</title>

</head>

<body>
     
  <header>
    
    <nav id="app_menu" class="navbar navbar-expand-lg navbar-dark px-2 fondo-gris">

      <div class="container-fluid">

        <div>
          <img src="../ima/codoacodo.png" alt="logotipo" class="img-fluid" width="100">
          <a class="navbar-brand" href="../index.jsp">Conf. Bs. As.</a>
        </div>

      </div>

    </nav>
    
  </header>

	<main>
		
		<h1>Registro de usuario</h1>
		
		<%
		if( mensaje != null ){
			out.println("<p class='text-danger'>"+ mensaje +"</p>");
		}
		%>		
		
		<p>Por favor, completa tus datos personales para registrarte en el sistema...</p>
	
		<form id="usuario_alta" action="../controller/usuario.jsp" onsubmit="usuario_proceso(event)" method="post">
		
	    <div class="row">
	
	      <div class="col-md m-1">
	        <input type="text" name="nombre" id="nombre" placeholder="Nombre" required onchange="usuario_validar(this)" class="form-control">
	        <p class="error form-text text-danger d-none"></p>
	      </div>
	
	      <div class="col-md m-1">
	        <input type="text" name="apellido" id="apellido" placeholder="Apellido" required onchange="usuario_validar(this)" class="form-control">
	        <p class="error form-text text-danger d-none"></p>
	      </div>
	      	      
	    </div>  
	    
	    <div class="row">
	
	      <div class="col-md m-1">
	        <input type="email" name="email" id="email" placeholder="Correo" required onchange="usuario_validar(this)" class="form-control">
	        <p class="error form-text text-danger d-none"></p>
	      </div>
	
	    </div>
	    
	    <div class="row">
	
	      <div class="col-md m-1">
	        <input type="password" name="password" id="password" placeholder="Password" required onchange="usuario_validar(this)" class="form-control">
	        <p class="error form-text text-danger d-none"></p>
	      </div>
	
	    </div>
	    
	    <div class="row text-start">
	    
	      <div class="col-md m-1">
	        <label for="cantidad" class="form-label">Categoría:</label>
	        <select class="form-select" name="categoria" id="categoria" >
	          <option value="oyente">Oyente</option>
	          <option selected value="estudiante">Estudiante</option>
	          <option value="trainee">Trainee</option>
	          <option value="junior">Junior</option>
	        </select>
	      </div>
	        	    
	    </div>

	    <div class="row">
	    
	      <div class="col-md m-1">
	        <button class="btn w-100 fondo-verde_claro" id="borrar_datos" type="reset">Borrar</button>
	      </div>	    
	      
	      <div class="col-md m-1">
	        <button class="btn w-100 fondo-verde_claro" id="confirmar_datos" type="submit">Confirmar</button>        
	      </div>
	      
	    </div>
	    
	    <div class="row">	             
	      <div class="col-md">	      	    
	    		<p class="errores form-text text-danger d-none"></p>
	    	</div>	      
	    </div>	    
		
		</form>
		
			
	</main>	

  <!-- app --> 
	<script src="../js/usuario.js"></script>
	<!-- boostrap --> 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>
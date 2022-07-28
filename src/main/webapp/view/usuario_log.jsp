
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.*" session="true" %>

<%
	String error = request.getParameter("error");
%>

<!DOCTYPE html>

<html lang="es">

<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
  <link rel="stylesheet" href="../css/main.css">
  
  <title>Ingreso de Usuario</title>

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
	
		<h1>Ingreso al Sistema</h1>
		
		<%
		if( error != null ){
			out.println("<p class='text-danger'>"+ error +"</p>");
		}
		%>
		
		<p>Por favor, ingresa tu email y contraseña para acceder a tu cuenta...</p>	
	
		<form id="usuario_log" action="../controller/usuario_log.jsp" method="post" onsubmit="usuario_proceso(event)" class="container-md" style="max-width: 25rem;" >
	    
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

	    <div class="row">
	      
	      <div class="col-md m-1">
	        <button class="btn w-100 fondo-verde_claro" id="usuario_ingresar" type="submit">Ingresar</button>        
	      </div>
	      
	    </div>
	    
	    <div class="row">	             
	      <div class="col-md">	      	    
	    		<p class="errores form-text text-danger d-none"></p>
	    	</div>	      
	    </div>	    
		
		</form>
		
		<p>Si no tienes una cuenta, puedes crearte una haciendo click <a href="usuario.jsp">aquí...</a></p>
		
			
	</main>	

  <!-- app --> 
	<script src="../js/usuario.js"></script>
	<!-- boostrap --> 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>  

</body>
</html>
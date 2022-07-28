
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="dao.CharlaDAO" %>

<%@ page import="model.Charla" %>

<%@ page import="model.Usuario" %>

<%@ page import="java.util.*" session="true" %>

<% // obejto sesion
	HttpSession sesion = request.getSession();
	Usuario usuario = sesion.getAttribute("usuario") != null ? (Usuario)sesion.getAttribute("usuario") : null;
	// modo modificar
	Integer id = request.getParameter("id") != null ? Integer.valueOf( request.getParameter("id") ) : 0;
	Charla charla = CharlaDAO.ver("id = " + id);
%>

<!DOCTYPE html>

<html lang="es">

<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
  <link rel="stylesheet" href="../css/main.css">
  
  <title>Conferencias B.A. - Charla</title>

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
              <a class="nav-link" href="usuario_main.jsp">Inicio</a>
            </li>            
            <li class="nav-item">
         			<a class='nav-link' href='../controller/usuario_out.jsp'>Cerrar Sesión</a>
            </li>            
          </ul>
          
        </div>  

      </div>

    </nav>
    
  </header>

	<main class="m-auto" style="max-width: 50rem">
	

		<form action="../controller/charla.jsp" onsubmit="charla_proceso(event)" method="post" class="w-100">
		
			<input type="number" hidden="1" name="id" id="id" value="<% out.print(charla != null ? charla.getId() : 0); %>">
		
			<input type="text" hidden="1" name="usuario_id" id="usuario_id" value="<% out.print(charla != null ? charla.getUsuario().getId() : ( usuario != null ? usuario.getId() : "" )); %>">
		
		  <div class="row mb-3">			
		
		    <div class="col-md">
		    	<%
		    	String titulo = ( charla != null ) ? charla.getTitulo() : "";		    	
		    	%>		    
		      <input type="text" name="titulo" id="titulo" placeholder="Título" value="<% out.print(titulo); %>" required onchange="charla_validar(this)" class="form-control" >
		      <p class="error form-text text-danger d-none"></p>
		    </div>
		
		  </div>				
		
		  <div class="row mb-3">
				
		    <div class="col">
		    	<%
		    	String detalle = ( charla != null ) ? charla.getDetalle() : "";		    	
		    	%>
		      <textarea name="detalle" id="detalle" rows="3" placeholder="Detalla el tema sobre el cual quieres hablar..." required onchange="charla_validar(this)" class="form-control"><% out.print(detalle); %></textarea>
		      <p class="error form-text text-danger d-none"></p>
		    </div>
		
		  </div>
		
		  <div class="row">
		          
		    <div class="col-md">
		      <button class="btn w-100 fondo-verde_claro" id="borrar_datos" type="reset">Borrar</button>
		    </div>	
		    
		    <div class="col-md">
		      <button class="btn w-100 fondo-verde_claro" id="confirmar_datos" type="submit">Enviar</button>        
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
  <script src="../js/charla.js"></script>
	<!-- boostrap --> 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>    

</body>
</html>

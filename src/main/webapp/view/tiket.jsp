
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="dao.TiketDAO" %>

<%@ page import="model.Tiket" %>

<%@ page import="model.Usuario" %>

<%@ page import="java.util.*" session="true" %>

<% // obejto sesion
	HttpSession sesion = request.getSession();
	Usuario usuario = sesion.getAttribute("usuario") != null ? (Usuario)sesion.getAttribute("usuario") : null;
	
	// modo modificar
	Integer id = request.getParameter("id") != null ? Integer.valueOf( request.getParameter("id") ) : 0;
	Tiket tiket = TiketDAO.ver("id = " + id);	
%>

<!DOCTYPE html>

<html lang="es">

<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
  <link rel="stylesheet" href="../css/main.css">
  
  <title>Venta de Tiket</title>

</head>

<body>
     
  <header>
    
    <nav id="app_menu" class="navbar navbar-expand-lg navbar-dark px-2 fondo-gris">

      <div class="container-fluid">

        <div>
          <img src="../ima/codoacodo.png" alt="logotipo" class="img-fluid" width="100">
          <a class="navbar-brand" href="../index.jsp">Conf. Bs. As.</a>
        </div>
        
				<% if( usuario != null ){ %>
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">        
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
        
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="usuario_tiket.jsp">Ver Tikets</a>
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
        				
				<% } %>        

      </div>

    </nav>
    
  </header>

	<main class="m-auto" style="max-width: 50rem">
	
	  <div class="row justify-content-center">
	
	    <div class="card col-md m-1 border-primary" style="width: 15rem; height: 15rem;">
	      <div class="card-body d-flex flex-column justify-content-around align-items-center">
	        <h5 class="card-title display-6"><b>Estudiante</b></h5>
	        <p class="card-text">Tienen un descuento</p>          
	        <p class="card-text"><b>80%</b></p>
	        <small class="text-muted">* Presentar documentación</small>
	      </div>
	    </div>
	
	    <div class="card col-md m-1 border-primary" style="width: 15rem; height: 15rem;">
	      <div class="card-body d-flex flex-column justify-content-around align-items-center">
	        <h5 class="card-title display-6"><b>Trainee</b></h5>
	        <p class="card-text">Tienen un descuento</p>          
	        <p class="card-text"><b>50%</b></p>
	        <small class="text-muted">* Presentar documentación</small>
	      </div>
	    </div>
	
	    <div class="card col-md m-1 border-warning" style="width: 15rem; height: 15rem;">
	      <div class="card-body d-flex flex-column justify-content-around align-items-center">
	        <h5 class="card-title display-6"><b>Junior</b></h5>
	        <p class="card-text">Tienen un descuento</p>          
	        <p class="card-text"><b>15%</b></p>
	        <small class="text-muted">* Presentar documentación</small>
	      </div>
	    </div>
	
	  </div>
	
	  <form id="tiket_alta" action="../controller/tiket.jsp" onsubmit="tiket_proceso(event)" method="post">
	
	    <div class="row">
	
	      <h3 class="col text-secondary small">VENTA</h3>
	
	    </div>
	
	    <div class="row">
	
	      <p class="col h1">VALOR DEL TIKET $<span id="valor_unitario">200</span></p>
	      
	    </div>
	    
	    <input type="number" hidden="1" name="id" id="id" value="<% out.print(tiket != null ? tiket.getId() : 0); %>">
	    
	    <% if( usuario == null ){ %>
	    
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
	    
	    <% }else{ %>
	    
	    <input type="text" name="nombre" id="nombre" hidden="1" value="<% out.print(usuario.getNombre()); %>" class="form-control">
	    <input type="text" name="apellido" id="apellido" hidden="1" value="<% out.print(usuario.getApellido()); %>" class="form-control">
	    <input type="email" name="email" id="email" hidden="1" value="<% out.print(usuario.getEmail()); %>" class="form-control">	   
	    <% 
	    }
			
	    %>
	   
	    <div class="row text-start">
	
	      <div class="col-md m-1">
	      	<%
		      	String cantidad = ( tiket != null ) ? String.valueOf( tiket.getCantidad() ) : "";		      	
	      	%>
	        <label for="cantidad" class="form-label">Cantidad</label>
	        <input type="number" name="cantidad" id="cantidad" min="1" step="1" value="<% out.print(cantidad); %>" required onchange="tiket_validar(this)" class="form-control m-1 ">
	        <p class="error form-text text-danger d-none"></p>
	      </div>
	      
	      <div class="col-md m-1">
	        <label for="descuento" class="form-label">Categoría</label>
	       	<% 
	       	Double descuento = 0.00; 
		      if( usuario == null ){
		    	  
		    	  descuento = ( tiket == null ) ? 0.00 : Double.valueOf( tiket.getDescuento() );	    	 
		      }
		      else{	    	  
		    	  switch( usuario.getCategoria() ){
		    	  case "oyente" : 		descuento = 0.00; break;
		    	  case "estudiante" : descuento = 0.80; break;
		    	  case "trainee" : 		descuento = 0.50; break;
		    	  case "junior" : 		descuento = 0.15; break;
		    	  }
		      }		      
		      %>
	      	<select name="descuento" id="descuento" onchange="tiket_total()"<% if( usuario != null ){ out.print(" readonly='1' value='"+descuento+"'"); } %> class="form-select">
	        	<option value="0.00" <% out.print( descuento == 0.00 ? "selected='1'" : ( usuario != null ? "hidden='1'" : "" ) ); %>>Oyente</option>
	          <option value="0.80" <% out.print( descuento == 0.80 ? "selected='1'" : ( usuario != null ? "hidden='1'" : "" ) ); %>>Estudiante</option>
	          <option value="0.50" <% out.print( descuento == 0.50 ? "selected='1'" : ( usuario != null ? "hidden='1'" : "" ) ); %>>Trainee</option>
	          <option value="0.15" <% out.print( descuento == 0.15 ? "selected='1'" : ( usuario != null ? "hidden='1'" : "" ) ); %>>Junior</option>
	        </select>
	      </div>        
	      
	    </div>
	
	    <div class="row text-start">
	
	      <div class="col-md m-1">
	      	<%
	      	String total = ( tiket != null ) ? String.valueOf( tiket.getTotal() ) : "";	      	
	      	%>
					<input type="number" name="total" id="total" value="<% out.print(total); %>" hidden="1">
	        <p class="alert alert-info" role="alert">Total a pagar $ <span id="valor_compra"><% out.print(total); %></span></p>					
	      </div>
	
	    </div>
		    
	    <div class="row">	             
	      <div class="col-md">	      	    
	    		<p class="errores form-text text-danger d-none"></p>
	    	</div>	      
	    </div>
	
	    <div class="row">
	              
	      <div class="col-md m-1">
	        <button class="btn w-100 fondo-verde_claro" id="borrar_datos" onclick="tiket_total()" type="reset">Borrar</button>
	      </div>
	      
	      <div class="col-md m-1">
	        <button class="btn w-100 fondo-verde_claro" id="confirmar_datos" type="submit">Comprar</button>        
	      </div>
	      
	    </div>
	    	    
	  </form>
	
	</main>

  <!-- app -->
  <script src="../js/tiket.js"></script>
  <script src="../js/usuario.js"></script>  
	<!-- boostrap --> 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>    

</body>
</html>

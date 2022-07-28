
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="model.Usuario" %>

<%@ page import="java.util.*" session="true" %>

<% // objeto sesion
	HttpSession sesion = request.getSession();
	Usuario usuario = sesion.getAttribute("usuario") != null ? (Usuario)sesion.getAttribute("usuario") : null;	
	// flujos de navegación
	session.setAttribute("last_page","index.jsp");
%>


<!DOCTYPE html>

<html lang="es">

<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
  <link rel="stylesheet" href="css/main.css">
  
  <title>Conferencias B.A.</title>

</head>

<body>
     
  <header>
    
    <nav id="app_menu" class="navbar navbar-expand-lg navbar-dark px-2 fondo-gris">

      <div class="container-fluid">

        <div>
          <img src="ima/codoacodo.png" alt="logotipo" class="img-fluid" width="100">
          <a class="navbar-brand" href="#" aria-current="page">Conf. Bs. As.</a>
        </div>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">        
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
        
          <ul class="navbar-nav">
          
            <li class="nav-item">
              <a class="nav-link" href="#nav-intro">La Conferencia</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#nav-oradores">Los oradores</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#nav-lugar_y_fecha">El lugar y la fecha</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#nav-ser_orador">Conviértete en orador</a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-success" href="view/tiket.jsp">Comprar tickets</a>
            </li>                        
           	<% if( usuario == null ){ %>
         		<li class="nav-item">
         			<a class='nav-link' href='view/usuario_log.jsp'>Ingresar</a>
       			</li>
	         	<% }else{ %>
         		<li class="nav-item">
         			<a class='nav-link' href='view/usuario_main.jsp'>Cuenta</a>
        		</li>
	         	<% } %>
          </ul>          
        </div>
      </div>
    </nav>
    
  </header>

	<main>
	  
	  <div id="nav-intro" class="text-white">
	
	    <div class="fondo-transparente d-flex h-100 align-items-center text-end">
	
	      <div class="row mx-2">
	
	        <div class="col-sm-5"></div>
	
	        <div class="col-sm-6">
	
	          <h2>Conf Bs As</h2>          
	
	          <p>Bs As llega por primera vez a la Argentina. Un evento para compartir con nuestra comunidad el conocimiento y experiencia de los experos que están creando el futuro de Internet. Ven a conocer a miembros del evento, a otros estudiantes de codo a codo y los oradores de primer nivel que tenemos para ti. ¡Te esperamos!</p>
	
	          <div class="d-grid gap-2 d-md-block">
	            <a href="#nav-ser_orador" role="button" class="btn btn-outline-light">Quiero ser orador</a>
	            <a href="view/tiket.jsp" role="button" class="btn btn-success">Comprar Tickets</a>
	          </div>
	
	        </div>
	
	        <div class="col-sm-1"></div>
	
	      </div>
	
	    </div>
	
	  </div>
	
	  <div id="nav-oradores" class="mb-3">
	
	    <div class="text-center">
	
	      <small class="text-muted">CONOCE A LOS</small>
	
	      <h2>ORADORES</h2>
	
	    </div>      
	
	    <div class="d-flex flex-wrap justify-content-center">
	      
	      <div class="card m-1">
	        <img src="ima/steve.jpg" class="card-img-top" alt="Steve Jobs">
	        <div class="card-body">
	          <span class="badge bg-warning text-dark">JavaScript</span>
	          <span class="badge bg-info">React</span>
	          <h5 class="card-title">Steve Jobs</h5>
	          <p class="card-text text-muted small">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Veritatis quod ullam iste quia praesentium in, provident ducimus molestiae accusantium ratione? Eius, illum. Labore laudantium quidem minus minima et cumque quas?</p>
	        </div>
	      </div>
	      
	      <div class="card m-1">
	        <img src="ima/bill.jpg" class="card-img-top" alt="Bill Gates">
	        <div class="card-body">
	          <span class="badge bg-warning text-dark">JavaScript</span>
	          <span class="badge bg-info">React</span>
	          <h5 class="card-title">Bill Gates</h5>
	          <p class="card-text text-muted small">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Veritatis quod ullam iste quia praesentium in, provident ducimus molestiae accusantium ratione? Eius, illum. Labore laudantium quidem minus minima et cumque quas?</p>
	        </div>
	      </div>
	
	      <div class="card m-1">
	        <img src="ima/ada.jpeg" class="card-img-top" alt="Ada Lovelace">
	        <div class="card-body">
	          <span class="badge bg-secondary">Negocios</span>
	          <span class="badge bg-danger">Startups</span>
	          <h5 class="card-title">Ada Lovelace</h5>
	          <p class="card-text text-muted small">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Veritatis quod ullam iste quia praesentium in, provident ducimus molestiae accusantium ratione? Eius, illum. Labore laudantium quidem minus minima et cumque quas?</p>
	        </div>
	      </div>
	
	    </div>
	
	  </div>
	
	  <div id="nav-lugar_y_fecha" class="card mb-3 border">
	    <div class="row g-0">
	
	      <div class="col-md-6 border">
	        <img src="ima/honolulu.jpg" class="img-fluid rounded-start" alt="Paisaje">
	      </div>
	
	      <div class="col-md-6 text-light fondo-gris border">
	        <div class="card-body text-start">
	          <h5 class="card-title">Bs As - Octubre</h5>
	          <p class="card-text">Buenos Aires es la provincia y localidad más grande del estado de Argentina, en los Estados Unidos. Honolulu es la más sureña de entre las principales ciudades estadounidenses. Aunque el nombre de Honolulu se refiere al área urbana en la costa sureste de la isla Oahu, la ciudad y el condado de Honolulu han formado una ciudad-condado consolidada que cubre toda la ciudad (aproximadamente 600 km<sup>2</sup> de superficie).</p>
	          <a href="https://es.wikipedia.org/wiki/Honolulu" target="blank" role="button" class="btn btn-outline-light">Conocé más</a>
	        </div>
	      </div>
	
	    </div>      
	  </div>
	
	  <div id="nav-ser_orador" class="container mb-3 text-center" style="max-width: 40rem;">
	  
	  	<small class="text-muted">CONVIERTETE EN UN</small>

			<h2>ORADOR</h2>
			
			<p>Anótate como orador para dar una <abbr title="Tipo de charla donde...">charla ignate</abbr>. Cuéntanos de qué quieres hablar...</p>
			
       <% 
     		if( usuario == null ){ %>
     			<p class="small">Debes tener una cuenta registrada.</p>
     			
     			<p class="text-secondary">Si ya tienes una cuenta, puedes ingresar desde <a href="view/usuario_log.jsp">aquí...</a></p>
     			
     			<p class="text-secondary">Si aún no la tienes, puedes crearla desde <a href="view/usuario.jsp">aquí...</a></p>
     		<% 
     		}else{  
     		%>
     			<form action="controller/charla.jsp" onsubmit="charla_proceso(event)" method="post">

						<input type="text" hidden="1" name="usuario_id" id="usuario_id" value="<% out.print( usuario.getId() ); %>">
					
					  <div class="row mb-3">			
					
					    <div class="col-md">
					      <input type="text" name="titulo" id="titulo" placeholder="Título" required onchange="charla_validar(this)" class="form-control" >
					      <p class="error form-text text-danger d-none"></p>
					    </div>
					
					  </div>				
					
					  <div class="row mb-3">
					
					    <div class="col">
					      <textarea name="detalle" id="detalle" rows="3" placeholder="Detalla el tema sobre el cual quieres hablar..." required onchange="charla_validar(this)" class="form-control"></textarea>
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
     		<%
     		}
     	%>
	
	  </div>
	
	</main>
	
  <footer class="content text-center fondo-azul_degradado">

    <nav class="row align-items-center">

      <div class="col-md-2">
        <a class="nav-link" href="#">Preguntas Frecuentes</a>
      </div>

      <div class="col-md-2">
        <a class="nav-link" href="#">Contáctanos</a>
      </div>

      <div class="col-md-2">
        <a class="nav-link" href="#">Prensa</a>
      </div>

      <div class="col-md-2">
        <a class="nav-link" href="#">Términos y Condiciones</a>
      </div>

      <div class="col-md-2">
        <a class="nav-link" href="#">Privacidad</a>
      </div>

      <div class="col-md-2">
        <a class="nav-link" href="#">Estudiantes</a>
      </div>

    </nav>    

  </footer>  

  <!-- bs + ico -->
  <script src="js/charla.js"></script>
  <script src="js/usuario.js"></script>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  
  <script src="https://kit.fontawesome.com/75a87d5511.js" crossorigin="anonymous"></script>

</body>
</html>
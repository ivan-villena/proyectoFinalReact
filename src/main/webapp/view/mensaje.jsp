
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.*" session="true" %>

<% // obejto sesion
	HttpSession sesion = request.getSession();
	Object usuario = sesion.getAttribute("usuario");
	// flujos de navgeacion	
	String last_page = sesion.getAttribute("last_page") != null ? (String)sesion.getAttribute("last_page") : null;
%>

<!DOCTYPE html>

<html lang="es">

<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
  <link rel="stylesheet" href="../css/main.css">
  
  <title>Conferencias B.A.</title>

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
            
            	<% 
           		if( usuario == null ){ %>
            		<li class="nav-item">
            			<a class='nav-link' href='usuario_log.jsp'>Ingresar</a>
								</li>            			
           		<% 
           		}else{  %>
		            <li class="nav-item">
		              <a class="nav-link" href="usuario_tiket.jsp">Ver Tikets</a>
		            </li>  
		            <li class="nav-item">
		              <a class="nav-link" href="usuario_charla.jsp">Ver Charlas</a>
		            </li>
		            <li class="nav-item">
           				<a class='nav-link' href='usuario_main.jsp'>Cuenta</a>
           			</li>
           		<%
           		}
            	%>
          </ul>
          
        </div>

      </div>

    </nav>
    
  </header>

	<main>
	
		<div class="container">
		<%
		
		String mensaje = request.getParameter("ok");
		String tipo = "";
		
		if( mensaje != null ){			
			%>
			
			<p><% out.println( mensaje ); %></p>
					
			<%			
		}
		else{
			
			mensaje = request.getParameter("error");
			
			if( mensaje != null ){
				%>
				
				<p><% out.println( mensaje ); %></p>
						
				<%
			}
		}
		
		if( last_page != null ){ 
			%>
			<a href="../<% out.print(last_page); %>">Volver...</a>				
			<% 
		} 
		%>
		</div>
	
	</main>

  <!-- boostrap -->    
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <!-- iconos -->
  <script src="https://kit.fontawesome.com/75a87d5511.js" crossorigin="anonymous"></script>

</body>
</html>
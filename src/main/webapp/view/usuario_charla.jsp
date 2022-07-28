
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="dao.CharlaDAO" %>

<%@ page import="model.Charla" %>

<%@ page import="model.Usuario" %>

<%@ page import="java.util.*" session="true" %>

<% // objeto sesion
	HttpSession sesion = request.getSession();
	Usuario usuario = (Usuario)sesion.getAttribute("usuario");
	// flujos de navegación
	session.setAttribute("last_page","view/usuario_charla.jsp");
%>

<!DOCTYPE html>

<html lang="es">

<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
  <link rel="stylesheet" href="../css/main.css">
  
  <title>Charlas Registradas</title>

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

	<main>
	
		<h1>Charlas Registradas</h1>
		
		<section class="container">
		
			<form class="mb-3 row" id="table_ver-charla" onsubmit="table_ver(event);">
			
				<div class="col col-md">
				
					<label for="charla_buscar" class="col-md col-form-label">Buscar por:</label>					
					<fieldset class="d-flex">
						<select name="columna" id="charla_ver_columna" title="Selecciona una columna para filtrar las filas...">
							<option value="titulo">Título</option>
							<option value="detalle">Detalle</option>
						</select>
						<b class="m-1">:</b>
						<input type="text" class="form-control" name="valor" id="charla_buscar">
						<button type="submit" class="btn" title="Buscar..."><i class="fa-solid fa-magnifying-glass"></i></button>
						<button type="button" class="btn" title="Ver todos..." onclick="table_ver_todo(this)"><i class="fa-solid fa-bars"></i></button>
					</fieldset>

				</div>
				
			</form>						
	
			<table class="table table-hover table-sm">
			
				<thead class="thead-dark">
					<tr>
						<th scope="col"></th>
						<th scope="col"></th>
						<th scope="col">Titulo</th>
						<th scope="col">Detalle</th>
					</tr>
				</thead>
				
				<tbody>
	        <%
	        Integer cuenta = 0;
	        for( Charla charla: CharlaDAO.listado( "usuario_id = " + usuario.getId() ) ) {
	        	cuenta++;
	        %>
	       	<tr>
	       		<td><a title="Modificar..." href="../view/charla.jsp?id=<% out.println( charla.getId() ); %>"><i class="fa-solid fa-edit"></i></a></td>
	       		<td><a title="Eliminar..." href="../controller/charla_eliminar.jsp?id=<% out.println( charla.getId() ); %>"><i class="fa-solid fa-trash"></i></a></td>
	       		<td column="titulo"><% out.println( charla.getTitulo() ); %></td>
	       		<td column="detalle"><% out.println( charla.getDetalle() ); %></td>
	       	</tr>
					<%
	        }
	        %>
				</tbody>
				<tfoot>
					<tr class="text-start">
						<th>Cantidad:</th>
						<td data-cuenta><% out.print( cuenta ); %></td>
					</tr>				
				</tfoot>
				
			</table>
		
		</section>		

		
	</main>

  <!-- app -->
  <script src="../js/main.js"></script>
  <!-- boostrap -->    
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <!-- iconos -->
  <script src="https://kit.fontawesome.com/75a87d5511.js" crossorigin="anonymous"></script>

</body>
</html>
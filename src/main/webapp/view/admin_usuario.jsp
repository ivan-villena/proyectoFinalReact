
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="dao.CharlaDAO" %>

<%@ page import="dao.TiketDAO" %>

<%@ page import="dao.UsuarioDAO" %>

<%@ page import="model.Usuario" %>

<%@ page import="java.util.*" session="true" %>

<% // objeto sesion	
	HttpSession sesion = request.getSession();
	// flujos de navegación
	session.setAttribute("last_page","view/admin_usuario.jsp");
%>

<!DOCTYPE html>

<html lang="es">

<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
  <link rel="stylesheet" href="../css/main.css">
  
  <title>Administrador: Ususarios</title>

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
              <a class="nav-link" href="admin_tiket.jsp">Ver Tikets</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="admin_charla.jsp">Ver Charlas</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="admin.jsp">Inicio</a>
            </li>            
          </ul>
          
        </div>        

      </div>

    </nav>
    
  </header>

	<main>		
	
		<h1>Listado de Usuarios Registrados</h1>
		
		<section class="container">

			<form class="mb-3 row" id="table_ver-usuario" onsubmit="table_ver(event);">
			
				<div class="col col-md">
				
					<label for="usuario_buscar" class="col-md col-form-label">Buscar por atributo:</label>					
					<fieldset class="d-flex">
						<select name="columna" id="usuario_ver_columna">
							<option value="nombre">Nombre</option>
							<option value="apellido">Apellido</option>
							<option value="categoria">Categoría</option>
							<option value="es_admin">¿Administrador?</option>
						</select>
						<b class="m-1">:</b>
						<input type="text" class="form-control" name="valor" id="usuario_buscar">
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
						<th scope="col">Id</th>
						<th scope="col">Nombre</th>
						<th scope="col">Apellido</th>
						<th scope="col">Categoria</th>
						<th scope="col">Email</th>
						<th scope="col">Telefono</th>
						<th scope="col">¿Administrador?</th>
						<th scope="col">Tikets</th>
						<th scope="col">Charlas</th>
					</tr>
				</thead>
				
				<tbody>
	        <%
	        Integer cuenta = 0;
	        for( Usuario usuario: UsuarioDAO.listado( null ) ) {
	        	cuenta++;
	        %>
	       	<tr>
						<td><a title="Eliminar..." href="../controller/usuario_eliminar.jsp?id=<% out.println( usuario.getId() ); %>"><i class="fa-solid fa-trash"></i></a></td>
						<td>
							<% if( ! usuario.getEs_admin() ) { %>
								<a title="Hacer Administrador" href="../controller/usuario_admin.jsp?es_admin=1&id=<% out.println( usuario.getId() ); %>"><i class="fa-solid fa-address-card"></i></a>
							<% }else{ %>
								<a title="Deshacer Administrador" href="../controller/usuario_admin.jsp?es_admin=0&id=<% out.println( usuario.getId() ); %>"><i class="fa-solid fa-ban"></i></a>
							<% } %>
						</td>	       	
	       		<td columna="id"><% out.println( usuario.getId() ); %></td>
	       		<td columna="nombre"><% out.println( usuario.getNombre() ); %></td>
	       		<td columna="apellido"><% out.println( usuario.getApellido() ); %></td>
	       		<td columna="categoria"><% out.println( usuario.getCategoria() ); %></td>
	       		<td columna="email"><% out.println( usuario.getEmail() ); %></td>
	       		<td columna="telefono"><% out.println( usuario.getTelefono() ); %></td>
	       		<td columna="es_admin"><% out.println( usuario.getEs_admin() ? "SI" : "NO" ); %></td>
	       		<td columna="tikets"><% out.println( TiketDAO.contar( "email = '" + usuario.getEmail()+"'" ) ); %></td>
	       		<td columna="charlas"><% out.println( CharlaDAO.contar( "usuario_id = " + usuario.getId() ) ); %></td>
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
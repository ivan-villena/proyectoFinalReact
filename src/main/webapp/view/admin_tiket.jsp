
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="dao.TiketDAO" %>

<%@ page import="model.Tiket" %>

<%@ page import="model.Usuario" %>

<%@ page import="java.util.*" session="true" %>

<% // objeto sesion	
	HttpSession sesion = request.getSession();
	// flujos de navegación
	session.setAttribute("last_page","view/admin_tiket.jsp");
%>

<!DOCTYPE html>

<html lang="es">

<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
  <link rel="stylesheet" href="../css/main.css">
  
  <title>Administrador: Tikets</title>

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
	
		<h1>Listado de Tikets Vendidos</h1>
		
		<section class="container">
		
			<form class="mb-3 row" id="table_ver-tiket" onsubmit="table_ver(event);">
			
				<div class="col col-md">
				
					<label for="tiket_buscar" class="col-md col-form-label">Buscar por atributo:</label>					
					<fieldset class="d-flex">
						<select name="columna" id="tiket_ver_columna" title="Selecciona una columna para filtrar las filas...">
							<option value="nombre">Nombre</option>
							<option value="apellido">Apellido</option>
							<option value="descuento">Descuento</option>
							<option value="cantidad">Cantidad</option>
							<option value="total">Total</option>
						</select>
						<b class="m-1">:</b>
						<input type="text" class="form-control" name="valor" id="tiket_buscar">
						<button type="submit" class="btn" title="Buscar..."><i class="fa-solid fa-magnifying-glass"></i></button>
						<button type="button" class="btn" title="Ver todos..." onclick="table_ver_todo(this)"><i class="fa-solid fa-bars"></i></button>
					</fieldset>

				</div>
				
			</form>				
	
			<table class="table table-hover table-sm">
			
				<thead class="thead-dark">
					<tr>
						<th scope="col">Id</th>
						<th scope="col">Nombre</th>
						<th scope="col">Apellido</th>
						<th scope="col">Email</th>
						<th scope="col">Descuento</th>
						<th scope="col">Cantidad</th>
						<th scope="col">Total</th>
					</tr>
				</thead>
				
				<tbody>
	        <%
	        Integer cuenta = 0;
	        // sumatorias
	        Double descuento = 0.00;
	        Integer cantidad = 0;
	        Double total = 0.00;
	        // maximos
	        Double max_descuento = 0.00;
	        Integer max_cantidad = 0;
	        Double max_total = 0.00;	        
	        // minimos
	       	Double min_descuento = null;
	        Integer min_cantidad = null;
	        Double min_total = null;
	        // recorrido
	        for( Tiket tiket: TiketDAO.listado( null ) ) {
	        	cuenta++;
	        	// sumatorias
	        	descuento += Double.valueOf(tiket.getDescuento());
	        	cantidad += tiket.getCantidad();
	        	total += tiket.getTotal();
	        	// maximos
	        	if( Double.valueOf(tiket.getDescuento()) >= max_descuento ){
	        		max_descuento = Double.valueOf(tiket.getDescuento());
	        	}
	        	if( tiket.getCantidad() >= max_cantidad ){
	        		max_cantidad = tiket.getCantidad(); 
	        	}
	        	if( tiket.getTotal() >= max_total ){
	        		max_total = tiket.getTotal();
	        	}
	        	// minimos
	        	if( min_descuento == null || Double.valueOf(tiket.getDescuento()) <= min_descuento ){
	        		min_descuento = Double.valueOf(tiket.getDescuento());
	        	}
	        	if( min_cantidad == null || tiket.getCantidad() <= min_cantidad ){
	        		min_cantidad = tiket.getCantidad(); 
	        	}
	        	if( min_total == null || tiket.getTotal() <= min_total ){
	        		min_total = tiket.getTotal();
	        	}
	        %>
	       	<tr>
	       		<td columna="id"><% out.print( tiket.getId() ); %></td>
	       		<td columna="nombre"><% out.print( tiket.getNombre() ); %></td>
	       		<td columna="apellido"><% out.print( tiket.getApellido() ); %></td>
	       		<td columna="email"><% out.print( tiket.getEmail() ); %></td>
	       		<td columna="descuento"><% out.print( Double.valueOf(tiket.getDescuento()) * 100 ); %>%</td>
	       		<td columna="cantidad"><% out.print( tiket.getCantidad() ); %></td>
	       		<td columna="total"><% out.print( tiket.getTotal() ); %></td>
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
					<tr>
						<th colspan="4" class="text-start">Sumatorias:</th>
						<td data-suma="descuento"></td>
						<td data-suma="cantidad"><% out.print( cantidad ); %></td>
						<td data-suma="total">$<% out.print( total); %></td>
					</tr>
					<tr>
						<th colspan="4" class="text-start">Promedios:</th>
						<td data-prom="descuento"><% out.print( (descuento / cuenta) * 100 ); %>%</td>
						<td data-prom="cantidad"><% out.print( cantidad / cuenta ); %></td>
						<td data-prom="total">$<% out.print( total / cuenta ); %></td>
					</tr>
					<tr>
						<th colspan="4" class="text-start">Máximos:</th>
						<td data-max="descuento"><% out.print( max_descuento * 100 ); %>%</td>
						<td data-max="cantidad"><% out.print( max_cantidad ); %></td>
						<td data-max="total">$<% out.print( max_total ); %></td>
					</tr>					
					<tr>
						<th colspan="4" class="text-start">Mínimos:</th>
						<td data-min="descuento"><% out.print( min_descuento * 100); %>%</td>
						<td data-min="cantidad"><% out.print( min_cantidad ); %></td>
						<td data-min="total">$<% out.print( min_total ); %></td>
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
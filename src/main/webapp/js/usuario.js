
function usuario_filtrar(){
	
}

// proceso: alta - modificacion
function usuario_proceso( event ){
	
		event.preventDefault();
				
		let
			form = event.target; 
			errores = form.querySelector('p.errores');
		
		errores.innerHTML = "";			
		
		if( !errores.classList.contains('d-none') ) errores.classList.add('d-none');
		
		if( form.querySelector('.is-invalid') ){
					
			errores.classList.remove('d-none');		
			errores.innerHTML = "Por favor, revise los datos ingresados...";
		}
		else{
			
			form.submit();
		}		
	
}

// validacion de atributos
function usuario_validar( input ){
	
	let 
		name = input.name, 
		value = input.value.trim(), 
		resultado = "",
		error = input.nextElementSibling,	
		errores = document.querySelector(`form[id*="tiket_"] p.errores`)
	;
	
	[ errores, error ].forEach( elemento => {
		if( elemento ){
			elemento.innerHTML = "";
			if( !elemento.classList.contains('d-none') ) elemento.classList.add('d-none');
		}		
	} );
	
	if( input.classList.contains('is-invalid') ) input.classList.remove('is-invalid');
	
	switch( name ){
		case 'nombre':
		case 'apellido':
			 
			if( !value ){
				
				resultado = "Es obligatorio...";
			}
			else if( !/[a-zA-Z\s]/.test(value) ){
				
				resultado = "Solo se permiten letras...";
			}
			else if( value.length > 25 ){
				
				resultado = "Debe tener menos de 25 letras...";
			}
			break;
			
		case 'email':
			
			if( !value ){
				
				resultado = "Es obligatorio...";
			}
			else if( !/^([\da-z_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/.test(value) ){
	
				resultado = "El formato es incorrecto...";
	
			}
			else if( value.length > 85 ){
				
				resultado = "Debe tener menos de 85 caracteres...";
			}
			break;
			
		case 'password':
		
			if( !value ){
				
				resultado = "Es obligatorio...";
			}
			else if( value.length > 10 ){
				
				resultado = "Debe tener menos de 10 letras, numeros o símbolos...";
			}
			break;
				
		case 'telefono':
		
			if( value ){
				
				if( !/[\d]/.test(value) ){
					
					resultado = "Solo se permiten números...";
				}
				else if( value.length != 8 ){
					
					resultado = "Debe tener 8 numeros...";
				}				
			}		
			break;
	}
	
	// proceso errores
	if( resultado ){			
			
		input.classList.add('is-invalid');
						
		if( error ){
			error.innerHTML = resultado;
			error.classList.remove('d-none');		
		}
	}
}
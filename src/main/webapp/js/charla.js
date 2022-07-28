

// proceso alta - modificacion
function charla_proceso( event ){
	
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

// validar atributos
function charla_validar( input ){
	
	let 
		name = input.name, 
		value = input.value.trim(), 
		resultado = "",
		error = input.nextElementSibling,		
		errores = document.querySelector(`form[id*="charla_"] p.errores`)
	;
	
	[ errores, error ].forEach( elemento => {
		if( elemento ){
			elemento.innerHTML = "";
			if( !elemento.classList.contains('d-none') ) elemento.classList.add('d-none');
		}		
	} );		
	
	if( input.classList.contains('is-invalid') ) input.classList.remove('is-invalid');
			
	switch( name ){
		case 'titulo':
			if( !value ){
				
				resultado = "Es obligatorio...";
			}
			else if( value.length > 100 ){
				
				resultado = "Debe tener menos de 100 caracteres...";
			}
			break;
		case 'detalle':
			if( !value ){
				
				resultado = "Es obligatorio...";
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
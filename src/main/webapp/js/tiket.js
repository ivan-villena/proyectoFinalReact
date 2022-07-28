
// primer llamado : por f5
tiket_total()

// calcular total
function tiket_total(){
	
  let
  	resultado = document.querySelector('#valor_compra'), 
    valor     = parseFloat(document.querySelector('#valor_unitario').innerHTML),
    cantidad  = parseInt(document.querySelector('#cantidad').value),
    descuento = parseFloat(document.querySelector('#descuento').value),
    total 		= document.querySelector('#total')
  ;
  
  resultado.innerHTML = "";

  if( cantidad ){
		total.value = ( valor * cantidad ) - ( valor * cantidad * descuento );
    resultado.innerHTML = total.value;
  }
}

// proceso alta / modificacion
function tiket_proceso( event ){
	
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

// validaciones por atributo
function tiket_validar( input  ){
	
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
	
	if( input.classList.contains('is-invalid') ){
		
		input.classList.remove('is-invalid');	
	}
	
	switch( name ){
		case 'cantidad':
			value = parseInt(value);
			if( !value || value < 1 ){
				resultado = "Debe ser al menos 1...";
			}
			else if( value > 20 ){
				resultado = "No puedes solicitar más de 20 por pedido...";
			}
			else{		
				tiket_total();				
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



function table_ver( event ){
	
	event.preventDefault();

  let 
    form    = event.target,
    table   = form.nextElementSibling,
    columna = form.querySelector(`select[name="columna"]`),
    valor   = form.querySelector(`input[name="valor"]`),    
    regExp  = new RegExp(`^${valor.value.trim()}`,'gi'),
    tr
  ;
  
  table.querySelectorAll(`tbody > tr > td[columna="${columna.value}"]`).forEach( td => {

    tr = td.parentElement;

    if( !tr.classList.contains('d-none') ) tr.classList.add('d-none');    

    if( !valor.value || regExp.test(td.innerText) ) tr.classList.remove('d-none');
  } );	
}

function table_ver_todo( button ){
	
	let 
		valor = button.previousElementSibling.previousElementSibling,
		submit = button.previousElementSibling
	;
	
	valor.value = "";
	
	submit.click();
	
}
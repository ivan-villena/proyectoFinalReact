
export function fecha_validar( $año, $mes, $dia ){

  let $_ = false;

  if( !!($año) && !!($mes) && !!($dia) ){

    if( ['1','3','5','7','8','10','12'].includes($mes) ){

      if( $dia > 0 && $dia <= 31) $_ = true; 

    }else if( $mes !== '2' ){ 

      if( $dia > 0 && $dia <= 30) $_ = true; 
    }
    else{
      let $val_dia = new Date( $año || new Date().getFullYear(),2,0 ).getDate();
      if( $dia > 0 && $dia <= $val_dia) $_ = true; 
    }
  }
  
  return $_;
};
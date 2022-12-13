
import { texto_agregar } from "./Texto.js";

// devuelvo valor numérico
export function numero_valor( $dat, $tot = 0 ){
  let $_ = $dat;

  if( $tot > 0 ){
    // agrego 0 al inicio
    $_ = texto_agregar( $_, $tot, "0" );
  }
  // parse-int o parse-float
  else{
    
    $_ = Number($dat);
  }
  return $_;
}

// limito valor numérico entre mínimo y máximo
export function numero_rango( $dat, $max = 1, $min = 1 ){

  let $_ = $dat;

  if( typeof($_) == 'string' ) $_ = numero_valor($_);

  while( $_ > $max ){ $_ -= $max; }

  while( $_ < $min ){ $_ += $max; }

  return $_;
}
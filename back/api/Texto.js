

export function texto_agregar( $dat, $tot = 0, $val = '', $lad = 'izq' ){

  let $_ = '';
  
  if( $lad == 'izq' ){

    $_ = $dat.toString().padStart($tot,$val);
  }
  else if( $lad == 'der' ){

    $_ = $dat.toString().padEnd($tot,$val);
  }
  else{

    $_ = $dat.toString();
  }

  return $_;
}
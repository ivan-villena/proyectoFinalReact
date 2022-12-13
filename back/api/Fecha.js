
import { numero_rango } from "./Numero.js";


export function fecha_objeto( $dat ){ 

  let $_, $={ tip: typeof($dat) };

  if( !$dat ){
    $_ = new Date();
  }
  // por timestamp
  else if( $.tip == 'number' || ( $.tip == 'string' && /^\d+$/g.test($dat) ) ){ 

    $_ = new Date( parseInt($dat) );
  }
  // formateo e instancio
  else if( $.tip == 'string' ){ 

    $.fec = fecha_datos($dat);

    if( $.fec.año && $.fec.mes && $.fec.dia ){ 

      $_ = new Date( $.fec.año, $.fec.mes, $.fec.dia ); 
    }
    else{
      $_ = $.fec;
    }
  }
  // {}: objeto vacío
  else if( $.tip=='object' ){

    if( $dat.año && $dat.mes && $dat.dia ){

      $_ = new Date( $dat.año, $dat.mes, $dat.dia );
    }
    else{
      $_ = $dat;
    }
  }
  return $_;
};

export function fecha_validar( $año, $mes, $dia ){

  let $_ = false;

  if( !!($año) && !!($mes) && !!($dia) ){

    if( ['1','3','5','7','8','10','12'].includes($mes) ){

      if( $dia > 0 && $dia <= 31) $_ = true; 

    }else if( $mes != '2' ){ 

      if( $dia > 0 && $dia <= 30) $_ = true; 
    }
    else{
      let $val_dia = new Date( $año || new Date().getFullYear(),2,0 ).getDate();
      if( $dia > 0 && $dia <= $val_dia) $_ = true; 
    }
  }
  
  return $_;
};

export function fecha_tipo( $dat, $tip='' ){

  let $_, $ = fecha_objeto( $dat );

  switch( $tip ){
  case 'dyh':       
    $_ = `${$.getFullYear()}/${$.getMonth()+1}/${$.getDate()} ${$.getHours()}:${$.getMinutes()}:${$.getSeconds()}`;  
    break;
  case 'hor': 
    $_ = `${$.getHours()}:${$.getMinutes()}:${$.getSeconds()}`;
    break;
  case 'dia': 
    $_ = `${$.getFullYear()}/${$.getMonth()+1}/${$.getDate()}`;
    break;
  case 'sem': 
    $_ = `${$.getMonth()+1}/${$.getDate()}`;
    break;
  }
  return $_;
};

export function fecha_datos( $val = "" ){

  let $_={}, $={};

  $.tie = $val.replace('T',' ').split(' ');  

  $.sep = /-/.test($.tie[0]) ? '-' : '/';

  $.fec = $.tie[0].split($.sep);

  $.hor = !!($.tie[1]) ? $.tie[1] : false;

  $_.mes = parseInt($.fec[1]);  

  if( $.fec[0].length == 4){ 
    $_.año = parseInt($.fec[0]);
    $_.dia = parseInt($.fec[2]);
  }else{
    $_.año = parseInt($.fec[2]);
    $_.dia = parseInt($.fec[1]);
  }

  if( $.hor ){
    $_.tie = $.hor;
    $.hor = $.hor.split(':');
    if( !!($.hor[2]) ){
      $_.seg = parseInt($.hor[2]);
    }
    if( !!($.hor[1]) ){
      $_.min = parseInt($.hor[1]);
    }
    $_.hor = parseInt($.hor[0]);
  }

  $_.val = [$_.dia,$_.mes,$_.año].join($.sep);

  if( fecha_validar($_.año,$_.mes,$_.dia,) ){
    $_.sem = fecha_tipo($_,'sem');
  }else{
    $_ = false;
  }
  
  return $_;  
};

export function fecha_kin( fecha ){

  const Año = { inicio: 1987, codigo: 87, incremento: 105, limite: 260 };

  const Meses = { "01":0,"02":31,"03":59,"04":90,"05":120,"06":151,"07":181,"08":212,"09":243,"10":13,"11":44,"12":74 };

  const Fecha = fecha_datos(fecha);

  let año_codigo, año_cuenta;

  // busco codigo anual desde 1987  
  año_codigo = Año.codigo;
  año_cuenta = Fecha.año;
  if( año_cuenta < Año.inicio ){

    while( año_cuenta < Año.inicio ){
      año_cuenta ++;
      año_codigo = numero_rango( año_codigo - Año.incremento, Año.limite);
    }
  }
  else if( año_cuenta > Año.inicio ){

    while( año_cuenta > Año.inicio ){
      año_cuenta --;
      año_codigo = numero_rango( año_codigo + Año.incremento, Año.limite);
    }
  }
  
  return numero_rango( año_codigo + Meses[Fecha.mes] + Fecha.dia, Año.limite);  
};
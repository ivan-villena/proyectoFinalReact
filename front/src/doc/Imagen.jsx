
import "./Imagen.css";

const Imagen = ({ dato={}, clase="", etilos={}, url }) => {

  if( !!url ){
    return (
      <img className={`imagen ${clase}`} src={url}></img>
    )    
  }else if( dato.imagen ){ 

    etilos.background = dato.imagen;
    return (
      <span className={`imagen ${clase}`} data-key={dato.id} style={etilos}></span>
    )
  }else{
    return (
      <img className={`imagen ${clase}`} src=""></img>
    )
  }
};

export default Imagen;

import "./Ficha.css";

export default function Ficha({ titulo, descripcion, imagen, atributos, detalle, contenido }){
  return ( 
    <section className="ficha">

      { titulo ? 
        <h3 className="tex-cur">{titulo}</h3>
      :
        ""          
      }

      { descripcion ? 
        <p className="tex-enf tex-cur">{descripcion}</p>
      : 
        ""
      }

      { imagen || atributos || detalle ? 
        <div className="detalle">

          { imagen ? imagen : "" }

          { ( atributos ) ? 
            <ul>
            {atributos.map( ( atributo, key ) => (
              <li key={key}>                
                <p><b className="ide">{atributo[0]}</b>: <i className="val">{atributo[1]}</i></p>
              </li> 
            ))}
            </ul> 
          : ( detalle ? 
              <p className="text-center tex-cur">{detalle}</p>  : ""
          )}
        </div>              
      :
        ""
      }
      {
        contenido ? contenido : ""
      }
    </section>
  );
}

import { Link } from "react-router-dom";

import { useState } from "react";

import { global_dat } from "../api/global";

import axios from "axios";

import { fecha_validar } from "../api/Fecha";

import Icono from "../doc/Icono.jsx"

import Imagen from "../doc/Imagen.jsx";

import Ficha from "../doc/Ficha.jsx";

export default function Buscar({ etiqueta }){

  const [ kin, setKin ] = useState({});
  const [ kinFecha, setKinFecha ] = useState("");

  const getKin = () => {
    if( fecha_validar( ...kinFecha.split('-') ) ){
      axios.get(global_dat+"kin/fecha/"+kinFecha).then(res => setKin(res.data)).catch( err => console.log(err) );
    }
  };

  return( 
    <form className="container" id="Kin-Buscar">

      <fieldset className="row justify-content-center align-items-center">
        { !etiqueta ? "" : (
          <div className="col-auto">
            <label htmlFor="Kin-Buscar-fecha" className="form-label">{etiqueta}</label>
          </div>
        )}
        <div className="col-auto mt-1">
          <input id="Kin-Buscar-fecha" name="fecha" type="date" className="form-control" title={etiqueta} 
          value={kinFecha}
          onChange={ (e) => setKinFecha(e.target.value)            
          }/>
        </div>
        <div className="col-auto">
          <button type="button" onClick={getKin}><Icono ide="confirmar" /></button>
        </div>
      </fieldset>

      <section className="resultado m-2 p-1 text-center">
        {
          !kin.id ? (
            <p className="carga">El resultado aparecerá aquí...</p>
          ) : (
            <>
              <h3>Kin #{kin.id} de 260</h3>

              <p className="tit">{kin.nombre}</p>
              
              <Link to={`/kin/${kin.id}`}>
                <Imagen clase="kin m-auto" dato={kin}/>
              </Link>

              <Ficha 
                titulo="Encantamiento del Kin"
                detalle={<q>{kin.descripcion}</q>}
              />

              <Ficha 
                titulo="Tono Galáctico"
                descripcion={`#${kin.tono.id} de 13: ${kin.tono.nombre}`}
                imagen={<Link to={`/tono/${kin.tono.id}`}><Imagen clase="tono" dato={kin.tono}/></Link>}
                atributos={[ 
                  ["Esencia",kin.tono.esencia], ["Acción",kin.tono.accion], ["poder",kin.tono.poder] 
                ]}
                contenido={
                  <>
                    <p className="tex">{kin.tono.preguntas}</p>
                    <p className="tex">{kin.tono.portador}</p>
                  </>
                }
              />

              <Ficha 
                titulo="Sello Solar"
                descripcion={`#${kin.sello.id} de 20: ${kin.sello.nombre}`}
                imagen={<Link to={`/sello/${kin.sello.id}`}><Imagen clase="sello" dato={kin.sello}/></Link>}
                atributos={[ 
                  ["Característica",kin.sello.caracteristica], ["Acción",kin.sello.accion], ["Poder",kin.sello.poder] 
                ]}
                contenido={
                  <>      
                    <p className="tit">Portador</p>
                    <p className="tex">{kin.sello.portador}</p>

                    <p className="tit">Sombra</p>
                    <p className="tex">{kin.sello.sombra}</p>

                    <p className="tit">Recomendaciones</p>
                    <ul>
                      {kin.sello.recomendaciones.split("\n").map( (recomendacion,key) => (
                        <li key={key}>{recomendacion}</li>
                      ))}
                    </ul>
                  </>
                }
              />              
            </>
          )
        }
      </section>

    </form>
  );

}
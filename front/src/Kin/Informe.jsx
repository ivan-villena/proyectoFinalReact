
import "../doc/Informe.css";

import Icono from "../doc/Icono.jsx";

import Imagen from "../doc/Imagen.jsx";

import Ficha from "../doc/Ficha.jsx";

import { Link, useParams, useNavigate } from "react-router-dom";

import { useState, useEffect } from "react";

import { global_dat } from "../api/global";

import axios from "axios";

export default function Informe(){

  /* obtengo parametros del url */
  const { id } = useParams();

  /* defino objetos */
  const [ kin, setKin ] = useState({});  
  const getKin = async ( Id ) => {
    axios.get(`${global_dat}kin/${Id}`).then( Kin => { setKin(Kin.data); });
  }
  
  /* carga inicial */
  useEffect( () =>{ getKin(id); }, [ kin ] );

  /* Navegacion */
  const navigate = useNavigate();
  const verKin = (id) => navigate(`/kin/${id}`);

  return !kin.id ? (
    <p className="carga">Cargando Datos del Kin...</p>
  ) : (
    <article className="informe">

      <header>        
        <button onClick={() => verKin( kin.id > 1 ? kin.id-1 : kin.id )}><Icono ide="flecha_izquierda"/></button>
        <div>
          <h2 className="tex-sub tex-cur">Kin #{kin.id} de 260</h2>
          <p className="h3 tex-enf">{kin.nombre}</p>
        </div>        
        <button onClick={() => verKin( kin.id < 260 ? kin.id+1 : kin.id )}><Icono ide="flecha_derecha"/></button>
      </header>

      <Imagen clase="kin m-auto" dato={kin}/>

      <Ficha titulo="Encantamiento del Kin"
        detalle={<q>{kin.descripcion}</q>}
      />

      <Ficha titulo="Tono Galáctico"
        descripcion={`#${kin.tono.id} de 13: ${kin.tono.nombre}`}
        imagen={<Link to={`/tono/${kin.tono.id}`}><Imagen clase="tono" dato={kin.tono}/></Link>}
        atributos={[ ["Esencia",kin.tono.esencia], ["Acción",kin.tono.accion], ["poder",kin.tono.poder] ]}
        contenido={
          <>
            <p className="tit">{kin.tono.aventura}</p>
            <p className="tex">{kin.tono.funcion}: {kin.tono.mandato}...</p>
          </>
        }
      />

      <Ficha titulo="Sello Solar"
        descripcion={`#${kin.sello.id} de 20: ${kin.sello.nombre}`}
        imagen={<Link to={`/sello/${kin.sello.id}`}><Imagen clase="sello" dato={kin.sello}/></Link>}
        atributos={[ ["Característica",kin.sello.caracteristica], ["Acción",kin.sello.accion], ["Poder",kin.sello.poder] ]}
        contenido={
          <>      
            <p className="tit">Sinónimos</p>
            <p className="tex">{kin.sello.sinonimos.replace("\n",'; ')}</p>
          </>
        }
      />

      

    </article>
  );
}
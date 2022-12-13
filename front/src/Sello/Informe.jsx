
import "../doc/Informe.css";

import Icono from "../doc/Icono.jsx";

import Imagen from "../doc/Imagen.jsx";

import Ficha from "../doc/Ficha.jsx";

import { useParams, useNavigate } from "react-router-dom";

import { useState, useEffect } from "react";

import { global_dat } from "../api/global";

import axios from "axios";

export default function Informe(){

  /* obtengo parametros del url */
  const { id } = useParams();

  /* defino objetos */
  const [ sello, setSello ] = useState({});
  const getSello = async ( Id ) => {
    axios.get(`${global_dat}sello/${Id}`).then( Sello => { setSello(Sello.data); });
  }
  
  /* carga inicial */
  useEffect( () =>{ getSello(id); }, [ sello ] );

  /* Navegacion */
  const navigate = useNavigate();
  const verSello = (id) => navigate(`/sello/${id}`);  

  return !sello.id ? (
    <p className="carga">Cargando Datos del Sello...</p>
  ) : (
    <article className="informe">

      <header>
        <button onClick={() => verSello( sello.id > 1 ? sello.id-1 : sello.id )}><Icono ide="flecha_izquierda"/></button>
        <div>
          <h2 className="tex-sub tex-cur">Sello #{sello.id} de 20</h2>
          <p className="h3 tex-enf">{sello.nombre} {sello.color}</p>
        </div>
        <button onClick={() => verSello( sello.id < 20 ? sello.id+1 : sello.id )}><Icono ide="flecha_derecha"/></button>
      </header>

      <Imagen clase="sello m-auto" dato={sello}/>

      <Ficha 
        titulo="Propiedades"
        atributos={[ ["Característica",sello.caracteristica], ["Acción",sello.accion], ["Poder",sello.poder] ]}
      />

      <section>
        <h3>Simbolismo</h3>
        {sello.significado}
      </section>

      <section>
        <h3>Sinónimos</h3>
        {sello.sinonimos}
      </section>      

      <section>
        <h3>Portador</h3>
        {sello.portador}
        {sello.sombra}
      </section>

    </article>
  );
}
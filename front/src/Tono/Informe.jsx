
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
  const [ tono, setTono ] = useState({});
  const getTono = async ( Id ) => {
    axios.get(`${global_dat}tono/${Id}`).then( Tono => { setTono(Tono.data); });
  }
  
  /* carga inicial */
  useEffect( () =>{ getTono(id); }, [ tono ] );

  /* Navegacion */
  const navigate = useNavigate();
  const verTono = (id) => navigate(`/tono/${id}`);

  return !tono.id ? (
    <p className="carga">Cargando Datos del Tono...</p>
  ) : (
    <article className="informe">

      <header>
        <button onClick={() => verTono( tono.id > 1 ? tono.id-1 : tono.id )}><Icono ide="flecha_izquierda"/></button>
        <div>
          <h2 className="tex-sub tex-cur">Tono #{tono.id} de 13</h2>
          <p className="h3 tex-enf">{tono.nombre}</p>
        </div>        
        <button onClick={() => verTono( tono.id < 13 ? tono.id+1 : tono.id )}><Icono ide="flecha_derecha"/></button>
      </header>

      <Imagen clase="tono m-auto" dato={tono}/>

      <Ficha 
        titulo="Propiedades"
        atributos={[ ["Esencia",tono.esencia], ["Acción",tono.accion], ["poder",tono.poder] ]}
      />

      <section>
        <h3>Función Radio-Resonante</h3>
        <p>{tono.principio}</p>
      </section>

      <section>
        <h3>Onda Encantada de la Aventura</h3>
        <p>{tono.aventura}, {tono.posicion}.</p>
        <p>{tono.funcion}: {tono.mandato}...</p>
      </section>

      <section>
        <h3>Portador</h3>
        <p>{tono.preguntas}</p>
        <p>{tono.portador}</p>
      </section>

    </article>
  );
}
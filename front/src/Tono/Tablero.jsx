
import "../doc/Tablero.css";

import "./Tablero.css";

import Imagen from "../doc/Imagen.jsx";

import { useNavigate } from "react-router-dom";

import { useState, useEffect } from "react";

import { global_dat } from "../api/global.js";

import axios from "axios";

export default function Tablero(){

  // variable estado 1: [ 13 sellos ]
  const [ tonos, setTonos ] = useState([]);
  const getTonos = async () => {
    axios.get(global_dat+"tono").then( res => setTonos(res.data) ).catch( err => console.log(err) );
  };

  // carga inicial
  useEffect( () => { getTonos(); },[]);

  /* enlaces */
  const navigate = useNavigate(); 

  const verTono = ( evt ) => {
    let elemento = evt.target;
    while( elemento.nodeName !== 'LI'  ){ elemento = elemento.parentElement; }
    navigate(`/tono/${elemento.classList[1].split('-')[1]}`);
  };

  return !tonos.length ? ( 
    <p className="carga">Cargando Onda Encantada...</p> 
  ) : (
    <ul className="tablero Tono Onda mx-auto py-2">
      {tonos.map( (tono, indice) => (
        <li key={indice} 
          className={`posicion ide-${tono.id}`} 
          title = {`Tono #${tono.id} de 13: ${tono.nombre}.\n -Esencia: ${tono.esencia}.\n -Poder: ${tono.poder}.\n -Acción: ${tono.accion}.\n -Aventura: ${tono.aventura}.\- Posición: ${tono.posicion}.\n -Función: ${tono.funcion}.\n -Mandato: ${tono.mandato}`}
          onClick={verTono}
        >
          <p className="tex nombre">{tono.nombre}</p>
          <Imagen clase="tono" dato={tono} />          
          <p className="tex descripcion">{tono.descripcion}</p>
        </li>
      ))}
    </ul>
  )
};



import "../doc/Tablero.css";

import "./Tablero.css";

import Imagen from "../doc/Imagen.jsx";

import { useNavigate } from "react-router-dom";

import { useState, useEffect } from "react";

import { global_dat } from "../api/global.js";

import axios from "axios";

export default function Tablero(){

  // variable estado 1: [ 20 sellos ]
  const [ sellos, setSellos ] = useState([]);
  const getSellos = async () => {
    axios.get(global_dat+"sello").then( res => setSellos(res.data) ).catch( err => console.log(err) );
  };

  // carga inicial
  useEffect( () => {
    getSellos();
  },[]);

  /* enlaces */
  const navigate = useNavigate(); 

  const versello = ( evt ) => {
    let elemento = evt.target;
    while( elemento.nodeName !== 'LI'  ){ elemento = elemento.parentElement; }
    navigate(`/sello/${elemento.classList[1].split('-')[1]}`);
  };

  return !sellos.length ? ( 
    <p className="carga">Cargando Sellos...</p> 
  ) : (
    <ul className={`tablero Sello mx-auto py-2`}>
      {sellos.map( (sello,indice) => (
        <li key={indice} 
          className={`posicion ide-${sello.id}`} 
          title = {`sello #${sello.id} de 20: ${sello.nombre} ${sello.color}.\n -Característica: ${sello.caracteristica}.\n -Acción: ${sello.accion}.\n -Poder: ${sello.poder}`}
          onClick={versello} 
          >
          <Imagen clase="sello" dato={sello} />
          <p className="tex nombre">{sello.nombre}</p>
          <p className="tex descripcion">{sello.descripcion}</p>
        </li>
      ))}
    </ul>
  )
};


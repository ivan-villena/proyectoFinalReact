
import Imagen from "../doc/Imagen.jsx";

import { useNavigate } from "react-router-dom";

import { useState, useEffect } from "react";

import axios from "axios";

import { global_dat } from "../api/global.js";

export default function Tabla(){

  // variable estado 1: [ 20 tonos ]
  const [ tonos, settonos ] = useState([]);
  const gettonos = async () => {
    axios.get(global_dat+"tono").then( res => settonos(res.data) ).catch( err => console.log(err) );    
  };

  // carga inicial
  useEffect( () => {
    gettonos();
  },[]);

  /* enlaces */
  const navigate = useNavigate(); 

  const vertono = ( evt ) => {
    let elemento = evt.target;
    while( elemento.nodeName !== 'LI'  ){ elemento = elemento.parentElement; }
    navigate(`/tono/${elemento.classList[1].split('-')[1]}`);
  };
  
  { !tonos.length ? 
    <p className="carga">Cargando tonos...</p>
    :
    <table className={`table tabla tono`}>
      <thead>
        <tr>              
          <th scope="col"></th>
          <th scope="col">#</th>
          <th scope="col">tono</th>
          <th scope="col">Esencia</th>
          <th scope="col">Poder</th>
          <th scope="col">Acción</th>
        </tr>
      </thead>
      <tbody>
        {tonos.map( tono => (
          <tr key={tono.id}>
            <td onClick={vertono}>{<Imagen clase="tono" dato={tono}/>}</td>
            <td>{tono.id}</td>
            <td>{tono.nombre}</td>
            <td>{tono.esencia}</td>
            <td>{tono.poder}</td>
            <td>{tono.accion}</td>
          </tr>
        ))}
      </tbody>
    </table>
  }

}
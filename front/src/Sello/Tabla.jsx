
import Imagen from "../doc/Imagen.jsx";

import { useNavigate } from "react-router-dom";

import { useState, useEffect } from "react";

import { global_dat } from "../api/global.js";

import axios from "axios";

export default function Tabla(){

  // variable estado 1: [ 20 sellos ]
  const [ sellos, setsellos ] = useState([]);
  const getsellos = async () => {
    axios.get(global_dat+"sello").then( res => setsellos(res.data) ).catch( err => console.log(err) );    
  };

  // carga inicial
  useEffect( () => {
    getsellos();
  },[]);

  /* enlaces */
  const navigate = useNavigate(); 

  const verSello = ( evt ) => {
    let elemento = evt.target;
    while( elemento.nodeName !== 'LI'  ){ elemento = elemento.parentElement; }
    navigate(`/sello/${elemento.classList[1].split('-')[1]}`);
  };
  
  { !sellos.length ? 
    <p className="carga">Cargando Sellos...</p>
    :
    <table className={`table tabla Sello`}>
      <thead>
        <tr>              
          <th scope="col"></th>
          <th scope="col">#</th>
          <th scope="col">Sello</th>
          <th scope="col">Color</th>
          <th scope="col">Característica</th>
          <th scope="col">Acción</th>
          <th scope="col">Poder</th>
        </tr>
      </thead>
      <tbody>
        {sellos.map( sello => (
          <tr key={sello.id}>
            <td onClick={verSello}>{<Imagen clase="sello" dato={sello}/>}</td>
            <td>{sello.id}</td>
            <td>{sello.nombre}</td>
            <td>{sello.color}</td>
            <td>{sello.caracteristica}</td>
            <td>{sello.accion}</td>
            <td>{sello.poder}</td>
          </tr>
        ))}
      </tbody>
    </table>
  }

}
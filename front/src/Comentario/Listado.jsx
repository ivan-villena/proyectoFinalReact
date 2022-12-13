
import { useState, useEffect } from "react";

import { global_dat } from "../api/global.js";

import { Link } from "react-router-dom";

import axios from "axios";

import Icono from "../doc/Icono.jsx";

import "../doc/Listado.css";

import "./Listado.css";

export default function Listado({ abm = false }){

  /* defino los estados */
  const [ comentarios, setComentarios ] = useState([]);
  const getComentarios = async () => {
    axios.get(`${global_dat}comentario`).then(res => setComentarios(res.data.reverse())).catch( err => console.log(err) );
  };

  /* ejecucion de codigo */
  useEffect( () => { getComentarios(); }, [ comentarios ]);

  const FechaFormato = ( fecha ) => {
    let fec = fecha.split("-");
    return `${fec[2]}/${fec[1]}/${fec[0]}`;
  };

  const eliminarComentario = async ( id ) => {
    await axios.delete(`${global_dat}comentario/${id}`);    
    getComentarios();
  };

  return !comentarios.length ? (
      <p className="carga">Cargando Comentarios...</p>
    ) : (
      <ul className="listado Comentario">
      {comentarios.map( (item,key) => (
        <li key={key}>
          <p>El {FechaFormato(item.createdAt)}, {item.nombre}{item.kin ? ( <> Kin: <Link to={`../kin/${item.kin}`}><i className="num">{item.kin}</i></Link></> ) : ""}{item.email ? <> ( <a href={`mailto:${item.email}`}>{item.email}</a> )</> : ""} escribió:</p>
          <p className="m-1"><q>{item.contenido}</q></p>
          { abm ? ( 
            <div>
              <Link to={`/comentario/administrar/${item.id}`} title="Editar el contenido del comentario"><Icono ide="editar"></Icono></Link>
              <button onClick={ () => eliminarComentario(item.id) } title="Eliminar el Comentario"><Icono ide="eliminar"></Icono></button>
            </div> ) 
          : "" }          
        </li>
      ) )}
      </ul>
    )
}

import "../doc/Tablero.css";

import "./Tablero.css";

import Imagen from "../doc/Imagen.jsx";

import { useNavigate } from "react-router-dom";

import { useState, useEffect } from "react";

import { global_dat } from "../api/global";

import axios from "axios";

export default function Tablero({ valores }){
  
  // variable estado 1: [ 260 kines ]
  const [ kines, setKines ] = useState([]);
  const getKines = async () => {
    axios.get(global_dat+"kin").then(res => setKines(res.data)).catch( err => console.log(err) );
  };
  // variable estado 2: [ 20 sellos ]
  const [ sellos, setSellos ] = useState([]);
  const getSellos = async () => {
    axios.get(global_dat+"sello").then(res => setSellos(res.data)).catch( err => console.log(err) );
  };  
  // variable estado 3: [ 13 sellos ]
  const [ tonos, setTonos ] = useState([]);
  const getTonos = async () => {
    axios.get(global_dat+"tono").then(res => setTonos(res.data)).catch( err => console.log(err) );
  };

  // ejecucion de codigo inicial
  useEffect( () => { getTonos(); getSellos(); getKines(); }, []);

  /* enlaces */
  const navigate = useNavigate(); 

  const verKin = ( evt ) => {
    let elemento = evt.target;
    while( elemento.nodeName !== 'LI'  ){ elemento = elemento.parentElement; }
    navigate(`/kin/${elemento.classList[1].split('-')[1]}`);
  };

  let valorPosicion = valores?.posicion;

  return !tonos.length || !sellos.length || !kines.length ? (
    <p className="carga">Cargando Tzolkin...</p>
  ) : (
    <ul className="tablero Kin">
      {sellos.map( sello => (
        <li key={1000 + sello.id} 
          className={`seccion Sello ide-${sello.id}`} 
          title={`Sello #${sello.id} de 20, ${sello.nombre}: ${sello.descripcion}`} >
          <Imagen clase="sello" dato={sello}/>
        </li>
      ))}
      {kines.map( kin => (
        <li key={kin.id} onClick={verKin} 
          className={`posicion ide-${kin.id}${kin.es_portal ? ' portal' : ''}${valorPosicion == kin.id ? ' val_pos' : ''}`} 
          title={`Kin #${kin.id} de 260, ${kin.nombre}: ${kin.descripcion}\n- Tono #${kin.tono} de 13, ${tonos[parseInt(kin.tono)-1].nombre}: ${tonos[parseInt(kin.tono)-1].descripcion}\n- Sello #${kin.sello} de 20, ${sellos[kin.sello-1].nombre}: ${sellos[kin.sello-1].descripcion}`}>
          <Imagen clase="tono" dato={tonos[parseInt(kin.tono)-1]}/>
          <p className="num id">{kin.id}</p>
        </li>
      ))}
    </ul> 
  );

};
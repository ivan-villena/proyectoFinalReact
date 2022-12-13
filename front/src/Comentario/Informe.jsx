
import { useState, useEffect } from "react";

import { useNavigate } from "react-router-dom";

import { global_dat } from "../api/global.js";

import axios from "axios";

import "../doc/Formulario.css";

export default function Informe(){

  /* enlaces */
  const navigate = useNavigate();

  /* estados */
  const [ nombre, setNombre ] = useState("");
  const [ email, setEmail ] = useState("");
  const [ kin, setKin ] = useState("");
  const [ contenido, setContenido ] = useState("");
  const [ error, setError ] = useState(false);

  // ejecucion de código
  useEffect( () => {}, [ error ]);
  
  /* procesos */  
  const validarComentario = () => {

    let hay_error = false;

    if( !nombre.trim() ){
      hay_error = "El nombre es obligatorio...";
    }
    else if( /[^A-Za-z\s]/.test(nombre) ){
      hay_error = "El nombre solo puede contener letras y espacios vacíos...";
    }

    if( email && !/^([\da-z_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/.test(email) ){
      hay_error = "El formato del email es incorrecto...";
    }

    if( kin && ( kin < 1 || kin > 260 ) ){
      hay_error = "El número de kin debe ser entre 1 y 260...";
    }

    if( !contenido.trim() ){
      hay_error = "El contenido está vacío...";
    }

    return hay_error;
  };

  const crearComentario = async ( evento ) => {    

    // ejecuto validaciones
    evento.preventDefault();
    let errorComentario = validarComentario();    

    if( errorComentario ){
      setError(errorComentario);
    }// agrego a la base
    else{      
      setError(false);
      await axios.post(`${global_dat}comentario`, { 
        'nombre': nombre, 'email': email, 'kin': kin ? kin : null, 'contenido': contenido 
      });
      // actualizo
      navigate("/comentario/");
    }
  };

  return ( 
    <form className="formulario Comentario container-sm" onSubmit={crearComentario}>

      <fieldset className="row mb-2 px-3">
        <div className="p-1 col">
          <input id="post-nombre" name="nombre" placeholder="Nombre y Apellido" required type="text" className="form-control" 
            value={nombre} onChange={e => setNombre(e.target.value)}
          />
        </div>
      </fieldset>

      <fieldset className="row mb-2 px-3">
        <div className="p-1 col-sm-8">
          <input id="post-email" name="email" placeholder="Email" type="email" className="form-control" 
            value={email} onChange={e => setEmail(e.target.value)}
          />
        </div>
        <div className="p-1 col-sm-4">
          <input id="post-kin" name="kin" placeholder="Kin" type="number" step="1" className="form-control" 
            value={kin ? kin : ""} onChange={e => setKin(e.target.value)}
          />    
        </div>                
      </fieldset>

      <fieldset className="row mb-2 px-3">
        <div className="p-1 col">
          <textarea id="post-contenido" name="contenido" rows="4" className="form-control" 
            value={contenido} onChange={e => setContenido(e.target.value)}
          >{contenido}</textarea>
        </div>
      </fieldset>

      <p className={`err tex-luz text-center m-1 p-2${ !error ? " d-none" : "" }`}>{error}</p>

      <fieldset className="row px-3">
        <div className="col">
          <button type="submit" className="form-control">Enviar</button>
        </div>
      </fieldset>
      
    </form>
  )
}
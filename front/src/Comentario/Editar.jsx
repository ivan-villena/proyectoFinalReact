import { useState, useEffect } from "react";

import { useNavigate, useParams } from "react-router-dom";

import { global_dat } from "../api/global.js";

import axios from "axios";

import "../doc/Formulario.css";

export default function Informe(){

  /* enlaces */
  const navigate = useNavigate();

  /* parametros */
  const { id } = useParams();

  /* estados */
  const [ nombre, setNombre ] = useState("");
  const [ email, setEmail ] = useState("");
  const [ kin, setKin ] = useState("");
  const [ contenido, setContenido ] = useState("");
  const [ Error, setError ] = useState("");

  // ejecucion de código
  useEffect( () => { 
    getComentario(id); 
  }, 
    [ Error ]
  );

  /* para obtener el comentario seleccionado */
  const getComentario = async () => {
    const res = await axios.get(global_dat+"comentario/"+id);
    // actualizo los estados
    setNombre(res.data.nombre);
    setEmail(res.data.email);
    setKin(res.data.kin);
    setContenido(res.data.contenido);
  };
  
  /* proceso */  
  const editarComentario = async ( evento ) => {

    // ejecuto validaciones
    evento.preventDefault();
    
    setError("");
    if( !contenido.trim() ){
      setError("El contenido está vacío...");
    }

    if( Error === "" ){
      // agrego a la base
      await axios.put( global_dat+"comentario/"+id, { 'nombre': nombre, 'email': email, 'kin': kin ? kin : null, 'contenido': contenido });
      // actualizo
      navigate("/comentario/administrar");
    }
  };

  return ( 
    <article className="container">
      <h2>Editar Comentario...</h2>

      <p>Por temas de consistencia, solo se puede editar el contenido del comentario...</p>

      <form className="formulario Comentario container-sm" onSubmit={editarComentario}>

        <fieldset className="row mb-2 px-3">
          <div className="p-1 col">
            <input id="post-nombre" name="nombre" placeholder="Nombre y Apellido" disabled type="text" className="form-control" 
              value={nombre} onChange={e => setNombre(e.target.value)}
            />
          </div>
        </fieldset>

        <fieldset className="row mb-2 px-3">
          <div className="p-1 col-sm-8">
            <input id="post-email" name="email" placeholder="Email" type="email" disabled className="form-control" 
              value={email} onChange={e => setEmail(e.target.value)}
            />
          </div>
          <div className="p-1 col-sm-4">
            <input id="post-kin" name="kin" placeholder="Kin" type="number" min="1" max="260" step="1" disabled className="form-control" 
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

        <p className={`Error m-1 p-2 err tex-luz text-center${ !Error ? " d-none" : "" }`}>{Error}</p>

        <fieldset className="row px-3">
          <div className="col">
            <button type="submit" className="form-control">Enviar</button>
          </div>
        </fieldset>
        
      </form>

    </article>
  )
}
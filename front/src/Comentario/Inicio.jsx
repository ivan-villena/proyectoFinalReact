
import Informe from "./Informe.jsx";

import Listado from "./Listado";

export default function Inicio(){

  return ( 
    <article className="container">

      <h2>Comentarios</h2>

      <p>Deja un comentario...</p>

      <Informe />

      <p>Comentarios realizados...</p>

      <Listado />

    </article>
  )
}
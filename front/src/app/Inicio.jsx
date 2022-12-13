
import BuscarKin from "../Kin/Buscar.jsx";

export default function Inicio(){
  return (
    <article className="container">
  
      <h2>Introducción</h2>
  
      <p>En el Sincronario cada día es un <b className="ide">kin</b>...</p>
  
      <p>Al combinar un <i className="ide">Sello Solar</i> ( forma de ser y hacer ) con un <i className="ide">Tono Galáctico</i> ( qué hacer con esa energía ), se obtiene el kin ( la energía/vibración diaria ).</p>

      <p>Para ver los datos de un kin, tono o sello, puedes hacer click en su imagen correspondiente cada vez que veas alguna en la página.</p>
  
      <p>Los Mayas relacionaban el centro de la galaxía como una deidad superior llamada Hunab Ku ("dador de movimiento y medida") que transmitía información cósmica a sus estrellas (en nuestro caso el sol), para que cobren vida a través de los procesos orgánicos e inorgánicos de la tierra y los demás planetas de nuestro sistema. Puedes saber más sobre la cosmología Maya en el Libro <a href="http://www.icpv.com.ar/hol/bib/fac#_02-03-" target="_blank" rel="noreferrer"><cite>El Factor Maya</cite></a>.</p>
  
      <p>Según la fecha de nacimiento de una persona se la puede relacionar a un <i className="ide">Kin</i> como si fuera un signo zodiacal. De esta forma la persona puede aprender sobre los poderes de su <i className="ide">Sello Solar</i> junto con sus sombras. También, el <i className="ide">Tono Galáctico</i> posiciona a la persona dentro de una Onda Encantada otorgandole mandatos de acción dentro de un grupo de energeías afines. Para saber más sobre este tema, lee <a href="http://www.icpv.com.ar/hol/bib/enc#_02-03-01-" target="_blank" rel="noreferrer"><cite>El Encantamiento del Sueño</cite></a></p>

      <p>Para saber tu Kin, ingresa tu fecha de nacimiento:</p>
  
      <BuscarKin/>
  
    </article>      
  )
};
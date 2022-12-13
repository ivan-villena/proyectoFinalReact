
import Tablero from "./Tablero.jsx";

export default function Listado(){

  return (
    <article className="container">
  
      <h2>Sellos Solares</h2>

      <p>En <a href="http://www.icpv.com.ar/hol/bib/fac#_04-04-02-04-" target="_blank" rel="noreferrer"><cite>El Factor Maya</cite></a> se definen los sellos desde un punto de vista icónico como símbolos sagrados. Cada sello solar se asocia a un conjunto de significados dentro de una escalera evolutiva de "el Ser".</p>
          
      <p>En <a href="http://www.icpv.com.ar/hol/bib/enc#_02-02-01-02-" target="_blank" rel="noreferrer"><cite>El Encantamiento del Sueño</cite></a> cada Sello está representado por un arquetipo que tiene cierta Característica y ejecuta una acción con un poder determinado. Estas propiedades se utilizan para armar el "encantamiento del kin".</p>

      <p>También, cada Sello pertenece a una <i className="ide">Raza Cósmica</i> dentro de una Célula del Tiempo (según su color: <a href="http://www.icpv.com.ar/hol/bib/enc#_03-04-" target="_blank" rel="noreferrer">codigo armónico</a> ) y a una <i className="ide">Familia Terrestre</i> dentro de un Clan Galáctico (según su posición: <a href="http://www.icpv.com.ar/hol/bib/enc#_03-02-" target="_blank" rel="noreferrer">codigo cromático</a>).</p>

      <Tablero />
      
    </article>
  );
};
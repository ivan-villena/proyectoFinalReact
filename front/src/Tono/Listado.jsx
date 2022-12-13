
import Tablero from "./Tablero.jsx";

export default function Listado(){  
  return (
    <article className="container">
  
      <h2>Los 13 Tonos Galácticos</h2>

      <p>En <a href="http://www.icpv.com.ar/hol/bib/fac#_04-04-01-" target="_blank" rel="noreferrer"><cite>El Factor Maya</cite></a>, se considera una serie de 13 números como los principios de la creación expresados en rayos de pulsación que emanan del centro galáctico ( Hunab Ku, "Dador de movimiento y medida" ).</p>
  
      <p>En <a href="http://www.icpv.com.ar/hol/bib/enc#_03-12-" target="_blank" rel="noreferrer"><cite>El Encantamiento del Sueño</cite></a> los Tonos Galácticos definen la Onda Encantada como una secuencia que describe un proceso ( una "aventura" ), compuesto por: el proposito de algo (tono 1, Magnético), sus desafíos (tono 2, Lunar), el servicio requerido (tono 3, Eléctrico), la forma de realizarlo (tono 4, Autoexistente), los recursos necesarios (tono 5, Entonado), organizarlos en equilibrio (tono 6, Rítmico), sintonizar los componentes (tono 7, Resonante) y lograr un modelo armónico (tono 8, Galáctico) para ejecutar la accion (tono 9, Solar), obtener los resultados (tono 10, Planetario), divulgar lo conseguido (tono 11, Espectral) cooperando con todo (tono 12, Cristal) y poder proceder con el siguiente planteo (tono 13, Cósmico).</p>

      <p>El tablero toma esta forma de "fractal" para representar estos ciclos constantes y repetitivos del movimiento de todas las cosas a través del espacio-tiempo.</p>

      <p>Para ver los datos de cada posición, pasa el mouse sobre ella. Para ver más información sobre el tono, haz click en él.</p>

      <Tablero/>
      
    </article>
  )
}
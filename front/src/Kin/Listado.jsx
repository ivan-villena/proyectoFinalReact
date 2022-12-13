
import KinTablero from "./Tablero.jsx";

export default function Listado(){
  return (
    <article className="container">

      <h2>Los 260 Kines</h2>

      <p>El Tzolkin es una matriz donde se ubican los 260 kines en distintos órdenes de cuentas:</p>

      <ul>
        <li>El giro Espectral: Las 4 Estaciones Galácticas de 13 Cromáticas cada una ( 52 cromáticas en total ).</li>
        <li>El giro Galáctico: Las 13 Trayectorias Armónicas de 5 Células cada una ( 65 células en total ).</li>
        <li>La Nave del Tiempo: Los 5 Castillos de 4 Ondas Encantadas cada uno ( 20 Ondas Encantadas en total ).</li>
      </ul>

      <p>Los kines que son <q>portal de activacion galáctica</q> están pintados en verde. 
        Estos 52 kines conforman gráficamente lo que se llama <q>Triple Combinacion Binaria</q> en el libro <a href="http://www.icpv.com.ar/hol/bib/asc#_02-01-02-" target="_blank"><cite>La Tierra en Ascenso</cite></a>. Se dice que en estos días hay una intensificación de las frecuencias energéticas.</p>

      <p>Cada kin está asociado a un número (del 1 al 260), lo que permite realizar operaciones matemáticas con ellos. Por ejemplo, podemos sumar los kines de dos personas y relacionar el kin resultante a una lectura de la frecuencia energética de la relación entre esas dos personas.</p>

      <p>También, cada uno tiene una lectura llamada <q>el encantamientod el kin</q>. 
        Esta se extrae del <a href="http://www.icpv.com.ar/hol/bib/enc#_04-01-" target="_blank"><cite>Encantamiento del Sueño</cite></a> al conjugar palabras claves que definen sus propiedades ( como el poder del sello asociado a ese kin, la función que cumple el tono, la célula armónica en la que se encuentra, si es o no un portal de activación galáctica, entre otros ).</p>    

      <p>Para saber más sobre cada kin, haz click en alguno de ellos:</p>        

      <KinTablero />

    </article>
  )
}
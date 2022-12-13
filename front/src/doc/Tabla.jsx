
import "./Tabla.css";

export default function Tabla({ clase, atributos=[], datos=[] }){
  let 
    ide = "",
    atr_tip_tex = typeof(atributos[0]) == 'string';
  ;
  console.log( datos );
  return (
    <table className={`table tabla${ !clase ? " "+clase : "" }`}>
      <thead>
        <tr>
          {atributos.map( (atributo, atr_key) => (
            <th key={atr_key} scope="col">
              { atr_tip_tex ? atributo : ( atributo[1] !== undefined ? atributo[1] : atributo[0] ) }
            </th>
          ))}
        </tr>
      </thead>
      <tbody>
        {datos.map( (item, key) => (
          <tr key={key}>{
            atributos.forEach( (atributo, atr_key) => ( 
              <td key={atr_key}>{!item[ ide = atr_tip_tex ? atributo : atributo[0] ] ? item[ide] : '...'}</td>
            ))
          }</tr>
        ))}
      </tbody>
    </table>
  );
};
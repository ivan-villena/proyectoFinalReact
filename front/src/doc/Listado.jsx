
export default function Listado({ datos=[], tipo="ul", clase="" }){

  if( tipo == "ul" ){
    return (
      <ul className={`listado${ clase ? " "+clase : "" }`}>
      {datos.map( (item,key) => ( 
        <li key={key}>{item}</li>
      ))}
      </ul>
    );
  }
  else if( tipo == "ol" ){
    return (
      <ol className={`listado${ clase ? " "+clase : "" }`}>
      {datos.map( (item,key) => ( 
        <li key={key}>{item}</li>
      ))}
      </ol>
    );
  }
  else if( tipo == "dl" ){
    return (
      <dl className={`listado${ clase ? " "+clase : "" }`}>
      {datos.map( (item,key) => ( 
        <>
          <dt key={key}>{item[0]}</dt>
          {item[1].map( (subItem,subKey) => (
            <dd key={subKey}>subItem</dd>
          ))}
        </>
      ))}
      </dl>
    );
  }

}
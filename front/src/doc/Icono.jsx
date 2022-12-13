
import "./Icono.css";

const ides = {
  menu: "menu", 
  flecha_derecha: "arrow_forward",
  flecha_izquierda: "arrow_back",
  fecha: "today",
  agregar: "add",
  editar: "edit",
  eliminar: "delete",
  confirmar: "done",
  cancelar: "cancel"
};

export default function Icono({ ide="", clase }){

  return (
    <span className={`icono${ clase ? " "+clase : "" }`}>{ides[ide] ? ides[ide] : ide}</span>
  )
}
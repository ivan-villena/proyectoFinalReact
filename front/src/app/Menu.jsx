
import { NavLink } from "react-router-dom";

import Icono from "../doc/Icono.jsx";

import "./Menu.css";

export default function Menu(){
  return (
    <nav className="navbar navbar-expand-sm">
      <div className="container-fluid align-items-start">

        <NavLink to="/" className='navbar-brand'>Sincronario</NavLink>

        <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <Icono ide="menu"/>
        </button>
        <div className="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
          <ul className="navbar-nav mb-ms-0">
            <li className="nav-item">
              <NavLink to="/kin/" className='nav-link' aria-current="page">Los 260 Kines</NavLink>
            </li>
            <li className="nav-item">
              <NavLink to="/tono/" className='nav-link' aria-current="page">Los 13 Tonos</NavLink>
            </li>              
            <li className="nav-item">
              <NavLink to="/sello/" className='nav-link' aria-current="page">Los 20 Sellos</NavLink>
            </li>
            <li className="nav-item">
              <NavLink to="/comentario/" className='nav-link' aria-current="page">Comentarios</NavLink>
            </li>            
          </ul>
        </div>
      </div>
    </nav>
  );
}

import React from 'react';

import ReactDOM from 'react-dom/client';

import { Link, BrowserRouter, Routes, Route } from "react-router-dom";

import './index.css';

// paginas
import Menu from "./app/Menu.jsx";
import Inicio from "./app/Inicio.jsx";
import KinInforme from "./Kin/Informe.jsx";
import KinListado from "./Kin/Listado.jsx";
import TonoInforme from "./Tono/Informe.jsx";
import TonoListado from "./Tono/Listado.jsx";
import SelloInforme from "./Sello/Informe.jsx";
import SelloListado from "./Sello/Listado.jsx";
import ComentarioInicio from "./Comentario/Inicio.jsx";
import ComentarioAdministrar from "./Comentario/Administrar.jsx";
import ComentarioEditar from "./Comentario/Editar";


const root = ReactDOM.createRoot( document.getElementById('root') );
root.render(
  <React.StrictMode>        
    <BrowserRouter>
      <header>
        <Menu />
      </header>

      <main>
        <Routes>
          <Route path='/' element={<Inicio />}/>

          <Route path='/kin' element={<KinListado />}/>
          <Route path='/kin/:id' element={<KinInforme />}/>

          <Route path='/sello' element={<SelloListado />}/>
          <Route path='/sello/:id' element={<SelloInforme />}/>

          <Route path='/tono' element={<TonoListado />}/>
          <Route path='/tono/:id' element={<TonoInforme />}/>          

          <Route path='/comentario' element={<ComentarioInicio />}/>
          <Route path='/comentario/administrar' element={<ComentarioAdministrar/>}/>
          <Route path='/comentario/administrar/:id' element={<ComentarioEditar />}/>
        </Routes>
      </main>
      
    </BrowserRouter>
  </React.StrictMode>
);

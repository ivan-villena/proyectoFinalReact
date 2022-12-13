
import express from "express";

import { verUsuarios, verUsuario, crearUsuario, editarUsuario, eliminarUsuario } from "../controlador/Usuario.js.js";

const UsuarioRutas = express.Router();

UsuarioRutas.get ("/", verUsuarios);

UsuarioRutas.get ("/:id", verUsuario);

UsuarioRutas.post ("/", crearUsuario);

UsuarioRutas.put("/:id", editarUsuario);

UsuarioRutas.delete("/:id", eliminarUsuario);

export default UsuarioRutas;
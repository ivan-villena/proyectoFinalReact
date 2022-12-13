
import express from "express";

import { verComentarios, verComentario, crearComentario, eliminarComentario, editarComentario } from "../controlador/Comentario.js";

const ComentarioRutas = express.Router();

ComentarioRutas.get("/", verComentarios);

ComentarioRutas.get("/:id", verComentario);

ComentarioRutas.post("/", crearComentario);

ComentarioRutas.put("/:id", editarComentario);

ComentarioRutas.delete("/:id", eliminarComentario);

export default ComentarioRutas;
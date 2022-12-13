
import express from "express";

import { verTonos, verTono } from "../controlador/Tono.js";

const TonoRutas = express.Router();

TonoRutas.get ("/", verTonos);

TonoRutas.get ("/:id", verTono);

export default TonoRutas;
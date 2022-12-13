
import express from "express";

import { verSellos, verSello } from "../controlador/Sello.js";

const SelloRutas = express.Router();

SelloRutas.get ("/", verSellos);

SelloRutas.get ("/:id", verSello);

export default SelloRutas;
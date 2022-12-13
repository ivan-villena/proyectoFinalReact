
import express from "express";

import { verKins, verKin, verKinFecha } from "../controlador/Kin.js";

const KinRutas = express.Router();

KinRutas.get ("/", verKins);

KinRutas.get ("/:id", verKin);

KinRutas.get ("/fecha/:id", verKinFecha);

export default KinRutas;
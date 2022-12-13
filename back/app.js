
import express from "express";

import cors from "cors";

import db from "./database/db.js";

/* inicio aplicacion */
const app = express();

app.use( cors() );

app.use( express.json() );

/* defino rutas */
import KinRutas from "./ruta/Kin.js";
app.use("/kin", KinRutas);

import SelloRutas from "./ruta/Sello.js";
app.use("/sello", SelloRutas);

import TonoRutas from "./ruta/Tono.js";
app.use("/tono", TonoRutas);

import ComentarioRutas from "./ruta/Comentario.js";
app.use("/comentario", ComentarioRutas);

/* inicio servidor */
try {
  await db.authenticate();
  console.log("Conexion establecida con la Base de Datos...");
}
catch( err ) {
  console.log(`Conexion fallida: ${err}...`);
}

const port = 8000;
app.listen( port, () => console.log(`Servidor iniciado en el puerto ${port}...`));
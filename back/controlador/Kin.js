
import KinModelo from "../modelo/Kin.js";

import SelloModelo from "../modelo/Sello.js";

import TonoModelo from "../modelo/Tono.js";

import { fecha_kin } from "../api/Fecha.js";

const datos = async ( kin ) => {
  kin.sello = await SelloModelo.findOne({ where : { id: kin.sello } });
  kin.tono = await TonoModelo.findOne({ where : { id: kin.tono } });
  return kin;
}

export const verKins = async (req, res) => {
  try {
    const kines = await KinModelo.findAll();
    res.json(kines);
  }
  catch( err ) {
    res.json({ message: err.message });
  }
};

export const verKin = async (req, res) => {
  try {
    const kin = await datos( await KinModelo.findOne({ where : { id: req.params.id } }) );
    res.json(kin);
  }
  catch( err ){
    res.json({ message: err.message });
  }
};

export const verKinFecha = async ( req, res ) => {
  try {
    let kin = await datos( await KinModelo.findOne({ where : { id: fecha_kin( req.params.id ) } }) );
    res.json(kin);
  }
  catch( err ){
    res.json({ message: err.message });
  }
};
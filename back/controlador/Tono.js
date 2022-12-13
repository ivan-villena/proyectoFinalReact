
import TonoModelo from "../modelo/Tono.js";

export const verTonos = async (req, res) => {
  try {
    const tonos = await TonoModelo.findAll();
    res.json(tonos);
  }
  catch( err ) {
    res.json({ message: err.message });
  }
};

export const verTono = async (req, res) => {
  try {
    const tono = await TonoModelo.findOne({ where : { id: req.params.id } });
    res.json(tono);
  }
  catch( err ){
    res.json({ message: err.message });
  }
};
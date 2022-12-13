
import SelloModelo from "../modelo/Sello.js";

export const verSellos = async (req, res) => {
  try {
    const sellos = await SelloModelo.findAll();
    res.json(sellos);
  }
  catch( err ) {
    res.json({ message: err.message });
  }
};

export const verSello = async (req, res) => {
  try {
    const sello = await SelloModelo.findOne({ where : { id: req.params.id } });
    res.json(sello);
  }
  catch( err ){
    res.json({ message: err.message });
  }
};
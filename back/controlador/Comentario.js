
import ComentarioModelo from "../modelo/Comentario.js";

export const verComentarios = async (req, res) => {  
  try {
    const comentarios = await ComentarioModelo.findAll();
    res.json(comentarios);
  }
  catch( err ) {
    res.json({ message: err.message });
  }
};

export const verComentario = async (req, res) => {
  try {
    const comentario = await ComentarioModelo.findOne({ where : { id: req.params.id } });
    res.json(comentario);
  }
  catch( err ){
    res.json({ message: err.message });
  }
};

export const crearComentario = async (req, res) => {
  try {
    await ComentarioModelo.create( req.body );    
    res.json({ message: `El Comentario ha sido creado...` });
  }
  catch( err ){
    res.json({ message: err.message });
  }
};

export const editarComentario = async (req, res) => {
  try {    
    await ComentarioModelo.update( req.body, { where : { id: req.params.id } });
    res.json({ message: `El Comentario ${req.params.id} ha sido actualizado...` });
  }
  catch( err ){    
    res.json({ message: err.message });
  }
};

export const eliminarComentario = async (req, res) => {
  try {
    await ComentarioModelo.destroy({ where : { id: req.params.id } });
    res.json({ message: `El Comentario ${req.params.id} ha sido eliminado...` });
  }
  catch( err ){
    res.json({ message: err.message });
  }
};
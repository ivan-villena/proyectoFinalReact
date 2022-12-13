
import axios from "axios";

const server = "http://localhost:8000/";

// lectura
export const dato_get = async ( url, ser = server ) => {
  try {
    const res = await axios.get( ser + url );
    return res.data;
  }catch( err ){
    console.log( err );
  }
};

// inserto
export const dato_post = async ( url, datos, ser = server ) => {
  try {
    const res = await axios.post( datos, ser + url );
    return res.data;
  }catch( err ){
    console.log( err );
  }
};

// actualizo
export const dato_put = async ( url, datos, ser = server ) => {
  try {
    const res = await axios.put( datos, ser + url );
    return res.data;
  }catch( err ){
    console.log( err );
  }
};

// elimino 
export const dato_delete = async ( url, id, ser = server ) => {
  try {
    const res = await axios.delete( id, ser + url );
    return res.data;
  }catch( err ){
    console.log( err );
  }
};
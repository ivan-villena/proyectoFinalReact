
import db from "../database/db.js";

import { DataTypes } from "sequelize";

const TonoModelo = db.define( "tono", {
  id: { 
    type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true, allowNull: false
  },
  nombre: { 
    type: DataTypes.STRING, allowNull: false 
  },
  nombre_maya: { 
    type: DataTypes.STRING, allowNull: false 
  },
  descripcion: { 
    type: DataTypes.STRING, allowNull: false 
  },
  esencia: { 
    type: DataTypes.STRING, allowNull: false 
  },
  poder: { 
    type: DataTypes.STRING, allowNull: false 
  },
  accion: { 
    type: DataTypes.STRING, allowNull: false 
  },
  imagen: { 
    type: DataTypes.STRING, allowNull: false 
  },
  preguntas: { 
    type: DataTypes.STRING, allowNull: false 
  },
  portador: { 
    type: DataTypes.TEXT, allowNull: false 
  },
  principio: { 
    type: DataTypes.STRING, allowNull: false 
  },
  aventura: { 
    type: DataTypes.STRING, allowNull: false 
  },
  posicion: { 
    type: DataTypes.STRING, allowNull: false 
  },
  funcion: { 
    type: DataTypes.STRING, allowNull: false 
  },
  mandato: { 
    type: DataTypes.STRING, allowNull: false 
  }
},{
  tableName: "tono"
});

export default TonoModelo;
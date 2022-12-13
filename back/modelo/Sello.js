
import db from "../database/db.js";

import { DataTypes } from "sequelize";

const SelloModelo = db.define( "sello", {

  id : { 
    type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true, allowNull: false
  },  
  nombre : { 
    type: DataTypes.STRING, allowNull: false
  },
  nombre_maya : { 
    type: DataTypes.STRING, allowNull: false
  },
  descripcion : { 
    type: DataTypes.STRING, allowNull: false
  },
  color : { 
    type: DataTypes.STRING, allowNull: false
  },
  codigo : { 
    type: DataTypes.STRING, allowNull: false
  },
  caracteristica : { 
    type: DataTypes.STRING, allowNull: false
  },
  accion : { 
    type: DataTypes.STRING, allowNull: false
  },
  poder : { 
    type: DataTypes.STRING, allowNull: false
  },
  imagen : { 
    type: DataTypes.STRING, allowNull: false
  },
  significado : { 
    type: DataTypes.TEXT, allowNull: false
  },
  sinonimos : { 
    type: DataTypes.TEXT, allowNull: false
  },
  sombras : { 
    type: DataTypes.TEXT, allowNull: false
  },
  portador : { 
    type: DataTypes.TEXT, allowNull: false
  },
  sombra : { 
    type: DataTypes.TEXT, allowNull: false
  },
  recomendaciones : { 
    type: DataTypes.TEXT, allowNull: false
  }

},{  
  tableName: "sello"
});

export default SelloModelo;
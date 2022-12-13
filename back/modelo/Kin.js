
import db from "../database/db.js";

import { DataTypes } from "sequelize";

const KinModelo = db.define( "kin", {

  id : { 
    type: DataTypes.SMALLINT, autoIncrement: true, primaryKey: true, allowNull: false
  },  
  nombre : { 
    type: DataTypes.STRING, allowNull: false
  },
  descripcion : { 
    type: DataTypes.TEXT, allowNull: false
  },
  imagen : { 
    type: DataTypes.STRING, allowNull: false
  },
  poder : { 
    type: DataTypes.STRING, allowNull: false
  },
  es_portal : { 
    type: DataTypes.TINYINT, allowNull: false
  },
  sello : { 
    type: DataTypes.SMALLINT, allowNull: false, references: { 
      model: { tableName: 'sello', schema: "static" }, key: 'id'
    }
  },
  tono : { 
    type: DataTypes.SMALLINT, allowNull: false, references: { 
      model: { tableName: 'tono', schema: "static" }, key: 'id'
    }
  },
  onda_encantada : { 
    type: DataTypes.SMALLINT, allowNull: false
  }

},{
  timestamps: true,
  tableName: "kin"
});

export default KinModelo;
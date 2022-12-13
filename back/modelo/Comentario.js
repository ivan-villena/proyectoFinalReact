
import db from "../database/db.js";

import { DataTypes } from "sequelize";

const PostModelo = db.define( "comentario", {

  id : { 
    type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true
  },
  nombre:{ 
    type: DataTypes.STRING, allowNull: false
  },
  email:{ 
    type: DataTypes.STRING
  },
  kin:{
    type: DataTypes.SMALLINT
  },
  contenido:{ 
    type: DataTypes.TEXT, allowNull: false, defaultValue: "",
  },
  createdAt:{ 
    type: DataTypes.DATE
  }
},{
  tableName: "comentario",
  timestamps: true
});

export default PostModelo;
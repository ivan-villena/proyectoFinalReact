
import { Sequelize } from "sequelize";

const db = new Sequelize( 
  "cac_react", 
  "root", 
  "", 
  {
    host: "localhost",
    dialect: "mysql",
    port: 3306
  }
);

export default db;
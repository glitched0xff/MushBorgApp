const HOST=process.env.HOSTDB
const USER=process.env.USERDB
const PASSWORD=process.env.PASSWORDDB
const DB=process.env.DB
const DIALECT=process.env.DIALECT


module.exports = {
    HOST:HOST,
    USER:USER,
    PASSWORD:PASSWORD,
    DB: DB,
    dialect: DIALECT,
    logging: false,
    pool: {
      max: 5,
      min: 0,
      acquire: 30000,
      idle: 10000,
    }
  };
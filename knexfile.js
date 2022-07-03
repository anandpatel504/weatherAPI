// Update with your config settings.

const Dotenv = require("dotenv");
Dotenv.config({ path: `${__dirname}/.env` });
const { DB_NAME, DB_USER, DB_PASS, DB_HOST, PORT } = process.env;

module.exports = {
  development: {
    client: "pg",
    connection: {
      database: DB_NAME,
      user: DB_USER,
      password: DB_PASS,
      host: DB_HOST,
      port: 5432,
    },
  },

  staging: {
    client: "pg",
    connection: {
      database: "my_db",
      user: "username",
      password: "password",
    },
    pool: {
      min: 2,
      max: 10,
    },
    migrations: {
      tableName: "knex_migrations",
      directory: "./migrations",
    },
  },

  production: {
    client: "pg",
    // connection: {
    //   database: process.env.DB_NAME,
    //   user:     process.env.DB_USER,
    //   password: process.env.DB_PASS
    // },
    connection: process.env.DATABASE_URL + "?ssl=true",
    pool: {
      min: 2,
      max: 10,
    },
    migrations: {
      tableName: "knex_migrations",
      directory: "./migrations",
    },
  },
};

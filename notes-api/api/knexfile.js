module.exports = {
  development: {
    client: 'pg',
    connection: {
      host: process.env.DB_HOST,
      port: process.env.DB_PORT,
      user: 'process.env.DB_USER',
      password: process.env.DB_PASSWORD,
      database: process.env.DB_DATABASE,
    },
  },

  test: {
    client: 'sqlite3',
    connection: ':memory:',
    useNullAsDefault: true,
  },

  staging: {
    client: 'pg',
    connection: {
      host: process.env.DB_HOST,
      port: process.env.DB_PORT,
      user: 'process.env.DB_USER',
      password: process.env.DB_PASSWORD,
      database: process.env.DB_DATABASE,
    },
  },

  production: {
    client: 'pg',
    connection: {
      host: process.env.DB_HOST,
      port: process.env.DB_PORT,
      user: 'process.env.DB_USER',
      password: process.env.DB_PASSWORD,
      database: process.env.DB_DATABASE,
    },
  },
};

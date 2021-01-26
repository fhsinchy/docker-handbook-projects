module.exports = {
  development: {
    client: 'pg',
    connection: {
      host: process.env.DB_HOST,
      port: 5432,
      user: 'postgres',
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
      port: 5432,
      user: 'postgres',
      password: process.env.DB_PASSWORD,
      database: process.env.DB_DATABASE,
    },
  },

  production: {
    client: 'pg',
    connection: {
      host: process.env.DB_HOST,
      port: 5432,
      user: 'postgres',
      password: process.env.DB_PASSWORD,
      database: process.env.DB_DATABASE,
    },
  },
};

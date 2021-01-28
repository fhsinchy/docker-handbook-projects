module.exports = {
  plugins: ["prettier"],
  extends: [
    'airbnb-base',
    'plugin:prettier/recommended'
  ],
  env: {
    node: true,
  },
  rules: {
    "global-require": 0
  }
};

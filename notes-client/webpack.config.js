module.exports = {
  module: {
    rules: [
      {
        test: /\.css$/i,
        use: [
          'css-loader',
        ],
      },
    ],
  },
};

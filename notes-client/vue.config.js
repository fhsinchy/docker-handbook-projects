module.exports = {
  devServer: {
    disableHostCheck: true,
  },
  chainWebpack: (config) => {
    config
      .plugin('html')
      .tap((args) => {
        // eslint-disable-next-line no-param-reassign
        args[0].title = 'Notes';
        return args;
      });
  },
};

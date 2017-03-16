var path = require('path');
var webpack = require('webpack');
var ExtractTextPlugin = require("extract-text-webpack-plugin");

module.exports = {
  entry: path.resolve(__dirname, 'js', 'index.js'),
  module: {
    loaders: [
      {
          exclude: /node_modules/,
          loader: 'babel',
          test: /\.js$/,
      }
    ]
  },
  plugins: [
    new webpack.optimize.UglifyJsPlugin({
      compress: {
        warnings: false,
      },
      output: {
        comments: false,
      },
    })
  ],
  output: { filename: 'index.js', path: path.resolve(__dirname, 'public', 'js'), publicPath: '/js/' }
};

import express from 'express';
import graphQLHTTP from 'express-graphql';
import path from 'path';
import webpack from 'webpack';
import WebpackDevServer from 'webpack-dev-server';
import * as webpackConfig from './webpack.config'

const APP_PORT = 8080;
const GRAPHQL_PORT = 3000;

let appServer;

function startAppServer(callback) {
  // Serve the Relay app
  const compiler = webpack(webpackConfig);
  appServer = new WebpackDevServer(compiler, {
    contentBase: '/public/',
    proxy: {'/graphql': `http://localhost:${GRAPHQL_PORT}`},
    publicPath: '/js/',
    stats: {colors: true}
  });

  // Serve static resources
  appServer.use('*', function(req, res) {
    res.sendFile(path.join( __dirname, './public/index.html'));
  });

  appServer.listen(APP_PORT, () => {
    console.log(`App is now running on http://localhost:${APP_PORT}`);
  });
}
startAppServer();

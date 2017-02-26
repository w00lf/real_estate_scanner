import 'babel-polyfill';
import React from 'react';
import Relay from 'react-relay';
import { render } from 'react-dom';
import configureStore from './store/configure_store';
import { Provider } from 'react-redux';
import { applyRouterMiddleware, Router, browserHistory } from 'react-router';
import routes from './routes';
import useRelay from 'react-router-relay';

const store = configureStore();

render(
  <Provider store={store}>
    <Router history={browserHistory} routes={routes} render={applyRouterMiddleware(useRelay)} environment={Relay.Store}/>
  </Provider>,
  document.getElementById('main')
);

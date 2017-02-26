import React from 'react';
import { Route, IndexRoute } from 'react-router';
import Relay from 'react-relay';
import App from './components/app';
import HomePage from './components/home_page';
import SourcePage from './components/source_page';
import SourcesPage from './components/sources_page';
import LogInPage from './components/log_in_page';

import SourceQuery from './queries/source_query';
import SourcesQuery from './queries/sources_query';

export default (
  <Route path="/" component={App}>
    <IndexRoute component={HomePage} />
    <Route path="/login" component={LogInPage} />
    <Route path="/sources" component={SourcesPage} queries={SourcesQuery} onEnter={requireAuth} />
    <Route path="/sources/:id" component={SourcePage} queries={SourceQuery} onEnter={requireAuth} />
  </Route>
);

function requireAuth(nextState, replace) {
  if (!sessionStorage.jwt) {
    replace({
      pathname: '/login',
      state: { nextPathname: nextState.location.pathname }
    });
    return
  }
  Relay.injectNetworkLayer(
   new Relay.DefaultNetworkLayer('/graphql', {
     headers: {
       Authorization: 'Bearer ' + sessionStorage.jwt
     }
   })
  );
}
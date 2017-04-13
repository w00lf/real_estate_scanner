import React from 'react';
import { Route, IndexRoute } from 'react-router';
import App from './components/app.jsx';
import HomePage from './components/home_page.jsx';
import SourcePage from './components/source_page.jsx';
import SourcesPage from './components/sources_page.jsx';
import LogInPage from './components/log_in_page.jsx';
import SourceQuery from './queries/source_query';
import SourcesQuery from './queries/sources_query';
import './helpers/relay_auth';

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
      state: { nextPathname: nextState.location.pathname },
    });
  }
}

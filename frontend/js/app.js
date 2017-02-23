import React from 'react';
import Relay from 'react-relay';
import ReactDOM from 'react-dom';
import { BoardApp, BoardRelayContainer } from './components/board';
import BoardRelayRoute from './components/board_relay_route'

ReactDOM.render(
  <Relay.RootContainer
      Component={BoardRelayContainer}
      route={new BoardRelayRoute()}
    />,
  document.getElementById('main')
);

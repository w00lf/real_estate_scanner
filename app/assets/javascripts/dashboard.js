import React from 'react';
import Relay from 'react-relay';
import ReactDOM from 'react-dom';
import { BoardApp, BoardRelayContainer } from 'board';
import BoardRelayRoute from 'board_relay_route'

ReactDOM.render(
  <Relay.RootContainer
      Component={BoardRelayContainer}
      route={new BoardRelayRoute()}
    />,
  document.getElementById('root')
);

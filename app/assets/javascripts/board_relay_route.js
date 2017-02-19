import Relay from 'react-relay';

class BoardRelayRoute extends Relay.Route {
  static queries = {
    source: () => Relay.QL`query { source(id: 1) }`,
  };
  static routeName = 'BoardRelayRoute';
}

export default BoardRelayRoute

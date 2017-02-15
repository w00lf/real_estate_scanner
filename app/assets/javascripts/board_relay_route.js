import Relay from 'react-relay';

class BoardRelayRoute extends Relay.Route {
  static queries = {
    offers: () => Relay.QL`query { offers(limit: 10) }`,
  };
  static routeName = 'BoardRelayRoute';
}

export default BoardRelayRoute

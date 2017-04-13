import Relay from 'react-relay';

class SourceRelayRoute extends Relay.Route {
  static queries = {
    source: () => Relay.QL`query { source(id: "abe3b498-2c21-4376-94ee-868d76b6c3fe") }`,
  };
  static routeName = 'SourceRelayRoute';
}

export default SourceRelayRoute

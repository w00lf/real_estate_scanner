import Relay from 'react-relay';

class SourcesRelayRoute extends Relay.Route {
  static queries = {
    source: () => Relay.QL`query { sources }`,
  };
  static routeName = 'SourcesRelayRoute';
}

export default SourcesRelayRoute

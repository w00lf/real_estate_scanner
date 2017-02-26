import Relay from 'react-relay';

export default {
  source: () => Relay.QL`query { source(id: $id) }`,
};
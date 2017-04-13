import Relay from 'react-relay';

export default {
  sources: () => Relay.QL`query { sources }`,
};

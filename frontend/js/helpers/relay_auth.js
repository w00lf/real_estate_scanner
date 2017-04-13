import Relay from 'react-relay';
import { RelayNetworkLayer, authMiddleware } from 'react-relay-network-layer';

Relay.injectNetworkLayer(new RelayNetworkLayer([
  authMiddleware({
    token: () => sessionStorage.jwt,
  }),
]));

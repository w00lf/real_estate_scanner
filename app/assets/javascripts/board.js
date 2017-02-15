import React from 'react';
import Relay from 'react-relay';

class BoardApp extends React.Component {
  render() {
    var _name = this.props.offers[0].price;
    return (
      <div>
        Boarding… {_name}
      </div>
    );
  }
}
var BoardRelayContainer = Relay.createContainer(BoardApp, {
  fragments: {
    offers: () => Relay.QL`
      fragment on Offer {
        price
      }
    `,
  },
});

export { BoardApp, BoardRelayContainer }

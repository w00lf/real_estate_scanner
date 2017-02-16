import React from 'react';
import Relay from 'react-relay';

class BoardApp extends React.Component {
  render() {
    var _name = this.props.source.title;
    return (
      <div>
        {_name}
      </div>
    );
  }
}
var BoardRelayContainer = Relay.createContainer(BoardApp, {
  fragments: {
    source: () => Relay.QL`
      fragment on Source {
        title,
        offers(first: 9) {
          edges {
            node {
              id,
              price
            }
          }
        }
      }
    `,
  },
});

export { BoardApp, BoardRelayContainer }

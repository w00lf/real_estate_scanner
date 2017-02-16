import React from 'react';
import Relay from 'react-relay';

class BoardApp extends React.Component {
  render() {
    return (
      <table>
        <tbody>
        <tr><td>{this.props.source.title}</td></tr>
        {this.props.source.offers.edges.map((item) => 
            ( <tr key={item.node.id}>
                <td>{item.node.id}</td>
                <td>{item.node.flat.address}</td>
                <td>{item.node.price}</td>
              </tr>)
        )}            
        </tbody>
      </table>
    );
  }
}
var BoardRelayContainer = Relay.createContainer(BoardApp, {
  fragments: {
    source: () => Relay.QL`
      fragment on Source {
        title,
        offers(first: 9, after: ) {
          edges {
            cursor
            node {
              id,
              price,
              flat {
                id,
                address
              }
            }            
          },
          pageInfo {
            hasNextPage,
            hasPreviousPage
          }
        }
      }
    `,
  },
});

export { BoardApp, BoardRelayContainer }

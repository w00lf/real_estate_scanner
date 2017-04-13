import React from 'react';
import Relay from 'react-relay';

class SourcePage extends React.Component {
  constructor(props, context) {
    super(props, context);
    this.props.relay.setVariables({ id: this.props.params.id });
  }

  nextPage(e) {
    e.preventDefault();
    const lastElem = this.props.source.offers.edges.slice(-1)[0];
    if (typeof lastElem === 'undefined') {
      e.target.style.visibility = 'hidden';
      return;
    }
    this.props.relay.setVariables({ cursor: lastElem.cursor });
  }
  setPerPage(e) {
    e.preventDefault();
    this.props.relay.setVariables({ size: e.target.value, cursor: null });
  }

  render() {
    return (
      <div>
        <form>
          <select onChange={this.setPerPage.bind(this)}>
            {[10, 20, 50, 100].map(quantuty => (
              <option key={quantuty} name={quantuty}>{quantuty}</option>),
              )}
          </select>
        </form>
        <table>
          <tbody>
            <tr><td>{this.props.source.title}</td></tr>
            {this.props.source.offers.edges.map(item =>
              (<tr key={item.node.id}>
                <td>{item.node.id}</td>
                <td>{item.node.flat.address}</td>
                <td>{item.node.price}</td>
              </tr>),
          )}
            <tr><td><a href="#" onClick={this.nextPage.bind(this)}>NextPage</a></td></tr>
          </tbody>
        </table>
      </div>
    );
  }
}

export default Relay.createContainer(SourcePage, {
  initialVariables: { cursor: null, size: 10 },
  fragments: {
    source: () => Relay.QL`
      fragment on Source {
        title,
        offers(first: $size, after: $cursor) {
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

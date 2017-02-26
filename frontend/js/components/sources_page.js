import React from 'react';
import {Link} from 'react-router';
import Relay from 'react-relay';

class SourcesPage extends React.Component {
  render() {
    return (
      <div>
        <table>
          <tbody>
          <tr><td>Sources:</td></tr>
          {this.props.sources.sources.map((item) =>
              ( <tr key={item.id}>
                  <td>
                    <Link to={'/sources/' + item.id}>{item.title}</Link>
                  </td>
                </tr>)
          )}
          </tbody>
        </table>
      </div>
    );
  }
}

// var SourcesPage = (<Relay.RootContainer Component={SourcesComponentContainer} route={new SourcesRelayRoute()} />);

export default Relay.createContainer(SourcesPage, {
  fragments: {
    sources: () => Relay.QL`
      fragment on QuerySources {
        sources {
          id,
          title
        }
      }
    `,
  },
});
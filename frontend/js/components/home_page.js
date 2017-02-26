import React from 'react';
import {Link} from 'react-router';
import {connect} from 'react-redux';

class HomePage extends React.Component {
  componentDidMount() {
    console.log('mounted!');
  }

  render() {
    return (
      <div className="jumbotron">
        <h1>Dashboard</h1>
        {this.props.logged_in || (<Link to="login">log in as a test user</Link>)}
      </div>
    );
  }
}


function mapStateToProps(state, ownProps) {
  return {logged_in: state.session};
}

export default connect(mapStateToProps)(HomePage);
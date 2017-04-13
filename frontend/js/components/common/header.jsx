import React, { PropTypes } from 'react';
import { Link, IndexLink } from 'react-router';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import * as sessionActions from '../../actions/session_actions';


class Header extends React.Component {
  constructor(_) {
    super();
    this.logOut = this.logOut.bind(this);
  }

  logOut(event) {
    event.preventDefault();
    this.props.actions.logOutUser();
  }

  render() {
    if (this.props.logged_in) {
      return (
        <nav>
          <IndexLink to="/" activeClassName="active">Home</IndexLink>
          {' | '}
          <Link to="/sources" activeClassName="active">Sources</Link>
          {' | '}
          <a href="/logout" onClick={this.logOut}>log out</a>
        </nav>
      );
    }
    return (
      <nav>
        <IndexLink to="/" activeClassName="active">Home</IndexLink>
        {' | '}
        <Link to="/login" activeClassName="active">log in</Link>
      </nav>
    );
  }
}

Header.propTypes = {
  actions: PropTypes.func.isRequired,
  logged_in: PropTypes.bool.isRequired,
};

function mapStateToProps(state, _) {
  return { logged_in: state.session };
}

function mapDispatchToProps(dispatch) {
  return {
    actions: bindActionCreators(sessionActions, dispatch),
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(Header);

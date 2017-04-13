import { browserHistory } from 'react-router';
import * as types from '../actions/action_types';
import initialState from './initial_state';

export default function sessionReducer(state = initialState.session, action) {
  switch (action.type) {
    case types.LOG_IN_SUCCESS:
      browserHistory.push('/');
      return !!sessionStorage.jwt;
    case types.LOG_IN_FAILURE:
      alert(action.message);
      return false;
    case types.LOG_OUT:
      browserHistory.push('/');
      return !!sessionStorage.jwt;
    default:
      return state;
  }
}

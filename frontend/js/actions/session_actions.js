import * as types from './action_types';
import sessionApi from '../api/session_api';

class Auth {
  static loggedIn() {
    return !!sessionStorage.jwt;
  }

  static logOut() {
    sessionStorage.removeItem('jwt');
  }
}

export function loginSuccess() {
  return {type: types.LOG_IN_SUCCESS}
}

export function loginFailure(reason) {
  return {type: types.LOG_IN_FAILURE, message: reason}
}

export function logInUser(credentials) {
  return function(dispatch) {
    return sessionApi.login(credentials).then(response => {
      if(response.jwt) {
        sessionStorage.setItem('jwt', response.jwt);
        dispatch(loginSuccess());
      }else {
        dispatch(loginFailure('Wrong email or password'));
      }
    }).catch(error => {
      throw(error);
    });
  };
}

export function logOutUser() {
  Auth.logOut();
  return { type: types.LOG_OUT }
}
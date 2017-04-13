class SessionApi {
  static login(credentials) {
    const request = new Request('http://localhost:3000/user_token', {
      method: 'POST',
      headers: new Headers({
        'Content-Type': 'application/json',
      }),
      body: JSON.stringify({ auth: credentials }),
    });


    return fetch(request).then(response => response.json()).catch(error => error);
  }
}

export default SessionApi;

import React, { Component } from 'react';

class Welcome extends Component {
  constructor(props) {
    super(props);
    this.state = { date: new Date(), counter: 0, currentDateDelta: 0 };
    this.changeTime = this.changeTime.bind(this)
  }

  changeTime() {
    this.setState(prevState => ({
      currentDateDelta: ( ( prevState.currentDateDelta + 1 ) % 11 )
    }))
  }

  componentDidMount() {
    this.timerID = setInterval(
      () => this.tick(),
      1000
    );
  }

  componentWillUnmount() {
    clearInterval(this.timerID);
  }

  tick() {
    this.setState((prevState, props) => ({
      date: new Date(((new Date()).getTime() + (prevState.currentDateDelta * (60 * 60 * 1000))))
    }));
    this.setState((prevState, props) => ({
      counter: prevState.counter + 1
    }));
  }

  render() {
    return (
      <div>
        <h1>Hello, {this.props.name}!</h1>
        <div>It is {this.state.date.toLocaleTimeString()}.</div>
        <div>Time was changed {this.state.counter} times</div>
        <button onClick={this.changeTime}>
          Change time(+1 hour, {this.state.currentDateDelta} now)
        </button>
      </div>
    );
  }
}

export default Welcome;

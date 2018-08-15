import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
// react-router
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
// react-hotkeys
import {HotKeys} from 'react-hotkeys';

//noddy components for testing routing
const Home = () => (
    <div>
      Home
    </div>
  )
const Somewhere = () => (
    <div>
      Somewhere
    </div>
  )

//simple hotkey map for testing HotKeys
const map = {
  'moveUp': 'up'
};

const handlers = {
  'moveUp': (event) => console.log('Move up hotkey called!')
};

class App extends Component {

  render() {
    return (
      <Router>
        <HotKeys keyMap={map} handlers={handlers}>
          <div className="App">
            <header className="App-header">
              <img src={logo} className="App-logo" alt="logo" />
              <h1 className="App-title">Welcome to React</h1>
            </header>
            <p className="App-intro">
              To get started, edit <code>src/App.js</code> and save to reload.
            </p>
            {/* Testing routing
             Button linking to home component */}
            <Link to="/">
              <button>home</button>
            </Link>
            <Link to="/somewhere">
              <button>somewhere else</button>
            </Link>
            {/* Placeholder for test components */}
            <div>
              <Route exact path="/" component={Home} />
              <Route exact path="/somewhere" component={Somewhere} />
            </div>
          </div>
        </HotKeys>
      </Router>
    );
  }
}

export default App;

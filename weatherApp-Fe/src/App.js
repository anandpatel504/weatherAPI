import React from "react";
import "./App.css";
import currentWeather from "./Components";

import {
  Route,
  BrowserRouter as Router,
  Switch,
  Redirect,
} from "react-router-dom";
export class App extends React.Component {
  render() {
    return (
      <div>
        <Router>
          <Switch>
            <Route path="/" component={currentWeather} />
            <Redirect to="/" />
          </Switch>
        </Router>
        <br />
      </div>
    );
  }
}

export default App;

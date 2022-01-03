import "./App.css";
import React from "react";
import { Route, Switch } from "react-router-dom";
import Login from "./Login";
import SignUp from "./SignUp";
import Home from "./Home";

const App = () => {
  return (
    <div className="app">
      <Switch>
        <Route exact path="/signup">
          <SignUp />
        </Route>
        <Route exact path="/">
          <Login />
        </Route>
      </Switch>
    </div>
  );
};

export default App;

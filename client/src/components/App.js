import "./App.css";
import { React, useState, useEffect } from "react";
import { Route, Switch } from "react-router-dom";
import Login from "./Login";
import SignUp from "./SignUp";
import Home from "./Home";
import GamesContainer from "./GameContainer";
import MatchContainer from "./MatchContainer";
import HeaderNonUser from "./HeaderNonUser";

const App = () => {
  const [user, setUser] = useState("");

  useEffect(() => {
    fetch("http://localhost:3000/me").then((r) => {
      if (r.ok) {
        r.json().then((user) => setUser(user));
      }
    });
  }, []);

  if (user) {
    return (
      <div className="app">
        <Home user={user} />
        <Switch>
          <Route exact path="/home">
            <Home />
          </Route>
          <Route exact path="/games">
            <GamesContainer />
          </Route>
          <Route exact path="/matches">
            <MatchContainer />
          </Route>
        </Switch>
      </div>
    );
  } else {
    return (
      <div className="app">
        <HeaderNonUser />
        <Switch>
          <Route exact path="/signup">
            <SignUp />
          </Route>
          <Route exact path="/">
            <Login setUser={setUser} />
          </Route>
        </Switch>
      </div>
    );
  }
};

export default App;

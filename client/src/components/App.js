import "./App.css";
import {React, useState, useEffect} from "react";
import { Route, Switch } from "react-router-dom";
import Login from "./Login";
import SignUp from "./SignUp";
import Home from "./Home";

const App = () => {

  const [user,setUser]=useState("")

  useEffect(() => {
    fetch("http://localhost:3000/me").then((r) => {
      if (r.ok) {
        r.json().then((user) => setUser(user))
      }
    })
  },[])
  if (user){
    return (
      <div className="app">
        <h2>Welcome Back, {user.username}</h2>
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
  }
  else {
  return (
    <div className="app">
      <Switch>
        <Route exact path="/signup">
          <SignUp />
        </Route>
        <Route exact path="/">
          <Login setUser={setUser}/>
        </Route>
      </Switch>
    </div>
  )};
};

export default App;

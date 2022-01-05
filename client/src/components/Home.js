import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import Button from "@mui/material/Button";
import Typography from "@mui/material/Typography";
import { useState } from "react";
import GameContainer from "./GameContainer";
import AddNewGame from "./AddNewGame";

const Home = ({ user }) => {
  const [userGames, setUserGames] = useState([]);
  const [clickFind, setClickFind] = useState(true);
  const [addNew, setAddNew] = useState(true);

  const handleFindGames = () => {
    fetch(`http://localhost:3000/users/${user.id}/games`)
      .then((res) => res.json())
      .then((gameData) => {
        setUserGames(gameData);
        setClickFind((clickFind) => !clickFind);
      });
  };

  const handleAddGame = () => {
    setAddNew((addNew) => !addNew);
  };

  return (
    <div>
      <h2>Welcome Back, {user.first_name}!</h2>
      {clickFind && addNew ? (
        <div>
          <Card sx={{ maxWidth: 275 }}>
            <CardContent align="center">
              <Typography variant="h5" component="div">
                View Games
              </Typography>
            </CardContent>
            <CardContent align="center">
              <Button size="small" align="right" onClick={handleFindGames}>
                Select games
              </Button>
            </CardContent>
          </Card>
          <Card sx={{ maxWidth: 275 }}>
            <CardContent align="center">
              <Typography variant="h5" component="div">
                Add New Game
              </Typography>
            </CardContent>
            <CardContent align="center">
              <Button size="small" align="right" onClick={handleAddGame}>
                Add Game
              </Button>
            </CardContent>
          </Card>
        </div>
      ) : !clickFind && addNew ? (
        <div>
          <GameContainer user={user} userGames={userGames} />
        </div>
      ) : clickFind && !addNew ? (
        <div>
          <AddNewGame />
        </div>
      ) : null}
    </div>
  );
};

export default Home;

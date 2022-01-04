import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import Button from "@mui/material/Button";
import Typography from "@mui/material/Typography";
import { useState } from "react";
import GamesContainer from "./GameContainer";

const Home = ({ user }) => {
  const [userGames, setUserGames] = useState([]);
  const [clickFind, setClickFind] = useState(true);

  let game_ids = [];

  const handleFindGames = () => {
    fetch(`http://localhost:3000/users/${user.id}/games`)
      .then((res) => res.json())
      .then((gameData) => {
        setUserGames(gameData);
        setClickFind((clickFind) => !clickFind);
      });
  };

  const mapGames = userGames.map((game) => {
    if (game_ids.includes(game.id) === false) {
      game_ids.push(game.id);
      return <GamesContainer key={game.id} id={game.id} name={game.name} />;
    }
  });

  return (
    <div>
      {clickFind ? (
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
      ) : (
        mapGames
      )}

      <br></br>
      <Card sx={{ maxWidth: 275 }}>
        <CardContent align="center">
          <Typography variant="h5" component="div">
            Add New Game
          </Typography>
        </CardContent>
        <CardContent align="center">
          <Button size="small" align="right">
            Add Game
          </Button>
        </CardContent>
      </Card>
    </div>
  );
};

export default Home;

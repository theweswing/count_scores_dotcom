import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import Button from "@mui/material/Button";
import Typography from "@mui/material/Typography";
import { useState } from "react";
import MatchContainer from "./MatchContainer";

const GameCard = ({ user, game, setSelectedGame }) => {
  const handleSelectGame = () => {
    setSelectedGame(game);
  };

  return (
    <div>
      <Card sx={{ maxWidth: 275 }}>
        <CardContent align="center">
          <Typography variant="h5" component="div">
            {game.name}
          </Typography>
        </CardContent>
        <CardContent align="center">
          <Button size="small" align="right" onClick={handleSelectGame}>
            Select Game
          </Button>
        </CardContent>
      </Card>
    </div>
  );
};

export default GameCard;

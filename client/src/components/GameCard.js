import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import Button from "@mui/material/Button";
import Typography from "@mui/material/Typography";
import { useState } from "react";
import MatchContainer from "./MatchContainer";
import Grid from "@mui/material/Grid";
import Box from "@mui/material/Box";

const GameCard = ({ user, game, setSelectedGame }) => {
  const handleSelectGame = () => {
    setSelectedGame(game);
  };

  return (
    <div>
      <Box container noValidate sx={{ mt: 3 }}>
        <Grid item xs={12} sx={{ mt: 3 }}>
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
        </Grid>
      </Box>
    </div>
  );
};

export default GameCard;

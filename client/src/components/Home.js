import GamesContainer from "./GameContainer";
import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import Button from "@mui/material/Button";
import Typography from "@mui/material/Typography";
import Matches from "./Matches";

const Home = () => {
  return (
    <div>
      <Card sx={{ maxWidth: 275 }}>
        <CardContent align="center">
          <Typography variant="h5" component="div">
            View Games
          </Typography>
        </CardContent>
        <CardContent align="center">
          <Button size="small" align="right" href="/games">
            Select games
          </Button>
        </CardContent>
      </Card>

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

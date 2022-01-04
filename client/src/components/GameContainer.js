import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import Button from "@mui/material/Button";
import Typography from "@mui/material/Typography";
import Matches from "./Matches";

const GamesContainer = ({ name }) => {
  return (
    <div>
      <Card sx={{ maxWidth: 275 }}>
        <CardContent align="center">
          <Typography variant="h5" component="div">
            {name}
          </Typography>
        </CardContent>
        <CardContent align="center">
          <Button size="small" align="right">
            Select Game
          </Button>
        </CardContent>
      </Card>

      <div>
        <br></br>
        <Matches />
      </div>
    </div>
  );
};

export default GamesContainer;

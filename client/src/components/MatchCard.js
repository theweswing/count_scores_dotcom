import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableContainer from "@mui/material/TableContainer";
import TableHead from "@mui/material/TableHead";
import TableRow from "@mui/material/TableRow";
import Paper from "@mui/material/Paper";

const MatchCard = ({ date, players }) => {
  const mapPlayers = players.map((player) => {
    if (player.is_winner === true) {
      return (
        <TableRow
          sx={{ "&:last-child td, &:last-child th": { border: 0 } }}
          key={player.id}
        >
          <TableCell>{`👑 ${player.name} 👑`}</TableCell>
          <TableCell>{player.score}</TableCell>
        </TableRow>
      );
    } else {
      return (
        <TableRow
          sx={{ "&:last-child td, &:last-child th": { border: 0 } }}
          key={player.id}
        >
          <TableCell>{player.name}</TableCell>
          <TableCell>{player.score}</TableCell>
        </TableRow>
      );
    }
  });

  return (
    <TableContainer component={Paper}>
      <Table sx={{ minWidth: 650 }} aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell>{`Date of Game: ${date}`}</TableCell>
          </TableRow>
          <TableRow>
            <TableCell>Players</TableCell>
            <TableCell>Score</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>{mapPlayers}</TableBody>
      </Table>
    </TableContainer>
  );
};

export default MatchCard;

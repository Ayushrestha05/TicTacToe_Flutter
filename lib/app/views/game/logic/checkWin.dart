bool checkWin(List<List<String?>>? board, String player) {
  // Check rows, columns, and diagonals for a win
  return board!.any((row) => row.every((square) => square == player)) ||
      List.generate(3, (i) => board.map((row) => row[i]).toList())
          .any((col) => col.every((square) => square == player)) ||
      (board[0][0] == player &&
          board[1][1] == player &&
          board[2][2] == player) ||
      (board[0][2] == player && board[1][1] == player && board[2][0] == player);
}

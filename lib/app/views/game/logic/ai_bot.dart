import 'dart:math';

import 'package:tictactoe/app/views/game/logic/checkWin.dart';

class AIBot {
  List<List<String?>>? board;

  AIBot(this.board) {
    this.board = board;
  }

  bool isFull() {
    for (var row in board!) {
      if (row.contains(null)) return false;
    }
    return true;
  }

  int evaluate(List<List<String?>>? board) {
    if (checkWin(board, 'O')) {
      return 10;
    } else if (checkWin(board, 'X')) {
      return -10;
    } else {
      return 0;
    }
  }

  int minimax(List<List<String?>>? board, int depth, bool isMaximizing,
      int alpha, int beta) {
    if (checkWin(board, 'O')) {
      return 10 - depth;
    } else if (checkWin(board, 'X')) {
      return depth - 10;
    } else if (isFull()) {
      return 0;
    }

    if (isMaximizing) {
      int bestValue = -1000;
      for (var i = 0; i < 3; i++) {
        for (var j = 0; j < 3; j++) {
          if (board![i][j] == null) {
            board[i][j] = 'O';
            bestValue =
                max(bestValue, minimax(board, depth + 1, false, alpha, beta));
            alpha = max(alpha, bestValue);
            board[i][j] = null;
            if (beta <= alpha) break;
          }
        }
      }
      return bestValue;
    } else {
      int bestValue = 1000;
      for (var i = 0; i < 3; i++) {
        for (var j = 0; j < 3; j++) {
          if (board![i][j] == null) {
            board[i][j] = 'X';
            bestValue =
                min(bestValue, minimax(board, depth + 1, true, alpha, beta));
            beta = min(beta, bestValue);
            board[i][j] = null;
            if (beta <= alpha) break;
          }
        }
      }
      return bestValue;
    }
  }

  List<int>? computerMove(List<List<String?>>? board) {
    int bestMoveValue = -1000;
    int bestMoveRow = -1;
    int bestMoveCol = -1;

    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        if (board![i][j] == null) {
          board[i][j] = 'O';
          int moveValue = minimax(board, 0, false, -1000, 1000);
          board[i][j] = null;
          if (moveValue > bestMoveValue) {
            bestMoveValue = moveValue;
            bestMoveRow = i;
            bestMoveCol = j;
          }
        }
      }
    }

    if (bestMoveRow != -1 && bestMoveCol != -1) {
      print('Computer makes move $bestMoveRow x $bestMoveCol');
      return [bestMoveRow, bestMoveCol];
    }
  }
}

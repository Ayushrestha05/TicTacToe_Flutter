import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tictactoe/app/views/game/logic/checkWin.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameState());

  void buildBoard({String? gameType}) {
    emit(
      state.copyWith(
          board: List.generate(
            3,
            (index) => List.generate(3, (index) => null),
          ),
          currentPiece: 'X',
          gameType: gameType),
    );
  }

  void placePiece({required int col, required int row, required String piece}) {
    state.board![row][col] = piece;
    if (checkWin(state.board, piece)) {
      log('Piece $piece has won!');
      emit(state.copyWith(isGameCompleted: true, winningPiece: piece));
    } else {
      emit(state.copyWith(currentPiece: state.currentPiece == 'X' ? 'O' : 'X'));
    }
  }
}

part of 'game_cubit.dart';

class GameState extends Equatable {
  bool? isGameCompleted = false;
  List<List<String?>>? board;
  String? winningPiece;
  String? currentPiece;
  String? gameType;

  GameState({
    this.isGameCompleted,
    this.board,
    this.winningPiece,
    this.currentPiece,
    this.gameType,
  });

  @override
  List<Object?> get props =>
      [board, isGameCompleted, winningPiece, currentPiece, gameType];

  GameState copyWith({
    bool? isGameCompleted,
    List<List<String?>>? board,
    String? winningPiece,
    String? currentPiece,
    String? gameType,
  }) {
    return GameState(
      isGameCompleted: isGameCompleted ?? this.isGameCompleted,
      board: board ?? this.board,
      winningPiece: winningPiece ?? this.winningPiece,
      currentPiece: currentPiece ?? this.currentPiece,
      gameType: gameType ?? this.gameType,
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/app/views/game/logic/ai_bot.dart';
import 'package:tictactoe/app/views/game/widgets/circle.dart';
import 'package:tictactoe/app/views/game/widgets/cross.dart';

import 'bloc/game_state_bloc/game_cubit.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(50),
          child: BlocBuilder<GameCubit, GameState>(
            builder: (context, state) {
              return Column(
                children: [
                  Table(
                    defaultColumnWidth: FlexColumnWidth(50),
                    children: [
                      TableRow(
                        children: List.generate(
                          3,
                          (index) => buildBoardPiece(
                            context,
                            col: index,
                            row: 0,
                            piece: state.currentPiece ?? 'X',
                            existingPiece: state.board?[0][index],
                            state: state,
                          ),
                        ),
                      ),
                      TableRow(
                        children: List.generate(
                          3,
                          (index) => buildBoardPiece(
                            context,
                            col: index,
                            row: 1,
                            piece: state.currentPiece ?? 'X',
                            existingPiece: state.board?[1][index],
                            state: state,
                          ),
                        ),
                      ),
                      TableRow(
                        children: List.generate(
                          3,
                          (index) => buildBoardPiece(
                            context,
                            col: index,
                            row: 2,
                            piece: state.currentPiece ?? 'X',
                            existingPiece: state.board?[2][index],
                            state: state,
                          ),
                        ),
                      ),
                    ],
                    border: const TableBorder(
                      horizontalInside:
                          BorderSide(width: 2, color: Colors.blue),
                      verticalInside: BorderSide(width: 2, color: Colors.blue),
                    ),
                  ),
                  if (state.winningPiece != null)
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Text('Check-mate!'),
                          Text('${state.winningPiece} has won!')
                        ],
                      ),
                    )
                  else
                    Container(
                      child: Text('It\'s your turn, ${state.currentPiece}'),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildBoardPiece(BuildContext context,
      {required int col,
      required int row,
      required String piece,
      String? existingPiece,
      required GameState state}) {
    return existingPiece == null
        ? GestureDetector(
            onTap: () async {
              if (state.winningPiece == null) {
                if (state.gameType != 'ai') {
                  context
                      .read<GameCubit>()
                      .placePiece(col: col, row: row, piece: piece);
                } else {
                  if (state.currentPiece == 'X') {
                    context
                        .read<GameCubit>()
                        .placePiece(col: col, row: row, piece: piece);

                    List<int>? AIMove =
                        AIBot(state.board).computerMove(state.board);
                    await Future.delayed(Duration(milliseconds: 500));
                    if (AIMove != null && AIMove.isNotEmpty) {
                      context.read<GameCubit>().placePiece(
                          col: AIMove[1],
                          row: AIMove[0],
                          piece: state.currentPiece! == 'X' ? 'O' : 'X');
                    }
                  }
                }
              }
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
              ),
              child: Container(
                height: 100,
                width: 100,
              ),
            ),
          )
        : Center(child: existingPiece == 'X' ? Cross() : Circle());
  }
}

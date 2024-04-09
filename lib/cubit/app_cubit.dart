import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/app_states.dart';
import '../game_logic.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  String activePlayer = 'x';
  bool gameOver = false;
  int turn = 0;
  String result = '';
  Game game = Game();
  bool isSwitched = false;

  void selectNumberOfPlayer(bool newValue) {
    isSwitched = newValue;
    emit(AppSelectNumberOfPlayerState());
  }

  void onTabGridView(int index) {
    game.playGame(index, activePlayer);
    activePlayer = (activePlayer == 'x') ? 'o' : 'x';
    if (!isSwitched && !gameOver) {
      autoPlay(activePlayer);
      activePlayer = (activePlayer == 'x') ? 'o' : 'x';
    }
    emit(AppOnTabGridViewState());
  }

  void onRepeatButton() {
    activePlayer = 'x';
    gameOver = false;
    turn = 0;
    result = '';
    isSwitched = false;
    Player.player_o = [];
    Player.player_x = [];
    emit(AppOnRepeatButtonState());
  }

  Future<void> autoPlay(activePlayer) async {
    int index = 0;
    List<int> emptyCells = [];

    for (int x = 0; x < 9; x++) {
      if (!(Player.player_x.contains(x) || Player.player_o.contains(x)))
        emptyCells.add(x);
    }
    Random random = Random();
    int randomIndex = random.nextInt(emptyCells.length);

    index = emptyCells[randomIndex];
    game.playGame(index, activePlayer);
    emit(AppAutoPlayState());
  }
}

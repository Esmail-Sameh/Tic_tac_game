import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_game/cubit/app_states.dart';

import '../game_logic.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit(): super(AppInitialStates());

  static AppCubit get(context)=>BlocProvider.of(context);

  String activePlayer = 'x';
  bool gameOver = false;
  int turn = 0;
  String result = '';
  Game game = Game();
  bool isSwitched = false;

  void selectNumberOfPlayer(bool newValue){
    isSwitched = newValue;
    emit(AppSelectNumberOfPlayerState());
  }


}
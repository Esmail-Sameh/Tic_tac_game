class Player{
  static const x = 'X';
  static const o = 'O';
  static const empty = '';
  static List<int> player_x = [];
  static List<int> player_o = [];


}

class Game{

  static void playGame(int index , String activePlayer){
    if(activePlayer == 'x'){
      Player.player_x.add(index);
    }else{
      Player.player_o.add(index);
    }
    }

}
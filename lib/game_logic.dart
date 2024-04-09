class Player{
  static const x = 'X';
  static const o = 'O';
  static const empty = '';
  static List<int> player_x = [];
  static List<int> player_o = [];


}

class Game{

   void playGame(int index , String activePlayer){

     if ((Player.player_x.isEmpty || !Player.player_x.contains(index)) &&
         (Player.player_o.isEmpty || !Player.player_o.contains(index))) {
       if (activePlayer == 'x') {
         Player.player_x.add(index);
       } else {
         Player.player_o.add(index);
       }
     }
    }

}
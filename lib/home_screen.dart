import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_game/cubit/app_cubit.dart';
import 'package:tic_tac_game/cubit/app_states.dart';
import 'package:tic_tac_game/game_logic.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Theme
              .of(context)
              .primaryColor,
          body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16, horizontal: 8),
                child: Column(
                  children: [
                    SwitchListTile.adaptive(
                        value: cubit.isSwitched,
                        title: Text(
                          'Turn on/off tow player',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onChanged: (newValue) {
                          cubit.selectNumberOfPlayer(newValue);
                        }),
                    Text(
                      'it\'s ${cubit.activePlayer} turn'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: GridView.count(
                          padding: EdgeInsets.all(8),
                          crossAxisCount: 3,
                          mainAxisSpacing: 5.0,
                          crossAxisSpacing: 5.0,
                          childAspectRatio: 1.0,
                          children: List.generate(
                              9,
                                  (index) =>
                                  buildGridViewItem(
                                    context,
                                    cubit.activePlayer,
                                    index,
                                  )
                          ),
                        )),
                    Text(
                      'result',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                    repeatButton(context),
                  ],
                ),
              )),
        );
      },
    );
  }

  Widget repeatButton(context) =>
      ElevatedButton.icon(
        onPressed: () {
          AppCubit.get(context).onRepeatButton();
        },
        icon: Icon(Icons.replay),
        label: Text(
          'Repeat the game',
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          iconColor: MaterialStateProperty.all(Colors.white),
        ),
      );

  Widget buildGridViewItem(context, String activePlayer, int index,) =>
      GestureDetector(
        onTap: () {
          AppCubit.get(context).onTabGridView(index);
        },
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Theme
                .of(context)
                .shadowColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              Player.player_x.contains(index) ? 'x' : Player.player_o.contains(
                  index) ? 'o' : '',
              style: TextStyle(
                color: Player.player_x.contains(index) ? Colors.blue : Colors
                    .pink,
                fontSize: 50,
              ),
            ),
          ),
        ),
      );
}

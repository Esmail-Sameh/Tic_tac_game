import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_game/cubit/app_cubit.dart';
import 'package:tic_tac_game/home_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        theme: ThemeData(
          // brightness: Brightness.dark,
          primaryColor: Color(0xff00061a),
          primarySwatch: Colors.blue,
          shadowColor: Color(0xff001456),
          splashColor: Color(0xff4169e8),
        ),
      ),
    );
  }
}

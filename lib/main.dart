import 'package:fl_bloc/blocs/int_bloc.dart';
import 'package:fl_bloc/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Example',
      home: BlocProvider(
        lazy: false,
        create: (context) => IntBloc(),
        child: HomeScreen(),
      ),
    );
  }
}

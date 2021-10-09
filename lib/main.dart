import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smashbros_app/providers/providers.dart';
import 'package:smashbros_app/utils/routes.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => UniverseProvider(), lazy: false,),
        ChangeNotifierProvider(create: (BuildContext context) => FighterProvider(), lazy: false,)
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smash Bros App',
      routes: getRoutes(),
      initialRoute: 'onBoard',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
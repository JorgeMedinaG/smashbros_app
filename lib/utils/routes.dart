import 'package:flutter/material.dart';
import 'package:smashbros_app/screens/details_screen.dart';
import 'package:smashbros_app/screens/fighters_screen.dart';
import 'package:smashbros_app/screens/filter_screen.dart';
import 'package:smashbros_app/screens/onboarding_screen.dart';


Map<String, WidgetBuilder>  getRoutes(){

  return {
    'onBoard' : (BuildContext context) => const OnBoardingScreen(),
    'fightersList' : (BuildContext context) => const FightersListScreen(),
    'details'  : (BuildContext context) => const FighterDetailsScreen(),
    'filters'  : (BuildContext context)=> const FilterScreen()
  };

}

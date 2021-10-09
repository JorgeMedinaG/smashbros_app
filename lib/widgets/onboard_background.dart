import 'package:flutter/material.dart';


class OnBoardBackground extends StatelessWidget {
  const OnBoardBackground({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(229, 82, 73, 1),
            Color.fromRGBO(42, 82, 190, 1)
          ]
        )
      ),
    );
  }
}
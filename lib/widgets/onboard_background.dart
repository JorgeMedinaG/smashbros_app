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
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // transform: Transform.rotate(angle: 1.2 ),
          colors: [
            Color.fromRGBO(229, 82, 73, 1),
            Color.fromRGBO(42, 82, 190, 1)
          ]
        )
      ),
    );
  }
}
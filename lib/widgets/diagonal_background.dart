import 'package:flutter/material.dart';


class DiagonalBackground extends StatelessWidget {
  const DiagonalBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper() ,
      child: Container(
        width: double.infinity,
        height: 300.0,
        color: const Color.fromRGBO(219, 48, 105, 1),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0,size.height );
    path.lineTo(size.width*3.5, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
  
}

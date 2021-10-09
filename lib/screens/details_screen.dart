import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smashbros_app/models/fighter.dart';



class FighterDetailsScreen extends StatelessWidget {
  const FighterDetailsScreen({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
  
    final Fighter fighter = ModalRoute.of(context)!.settings.arguments as Fighter;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          ClipPath(
            clipper: MyClipper() ,
            child: Container(
              width: double.infinity,
              height: 375.0,
              color: const Color.fromRGBO(219, 48, 105, 1),
            ),
          ),
          FighterInfo(fighter: fighter)
        ],
      )
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0,size.height );
    path.lineTo(size.width*4.5, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
  
}


class FighterInfo extends StatelessWidget {
  const FighterInfo({
    Key? key,
    required this.fighter,
  }) : super(key: key);

  final Fighter fighter;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.arrow_back_ios_new, color: Colors.white,)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(fighter.name,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(fighter.universe,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 250.0,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text("${fighter.downloads} downloads",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ),
                      Container(
                        width: 84.0,
                        height: 40.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: Colors.white,
                        ),
                        child: Text(NumberFormat.simpleCurrency(decimalDigits: 0).format(int.parse(fighter.price)),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color.fromRGBO(219, 48, 105, 1),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: CachedNetworkImage(imageUrl: fighter.imageUrl)
                  )
                ],
              ),
            ),
            Text(fighter.description,
              style: const TextStyle(
                fontSize: 14.0,
                height: 2.0
              ),
            )
          ],
        ),
      ),
    );
  }
}


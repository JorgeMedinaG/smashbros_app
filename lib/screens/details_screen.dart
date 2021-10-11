import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

import 'package:smashbros_app/models/fighter.dart';
import 'package:smashbros_app/utils/custom_icon_icons.dart';
import 'package:smashbros_app/widgets/widgets.dart';


class FighterDetailsScreen extends StatelessWidget {
  const FighterDetailsScreen({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
  
    final Fighter fighter = ModalRoute.of(context)!.settings.arguments as Fighter;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color.fromRGBO(219, 48, 105, 1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white,),
          padding: const EdgeInsets.only(left: 20.0),
          onPressed: () => Navigator.of(context).pop(), 
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const DiagonalBackground(),
            FighterInfo(fighter: fighter)
          ],
        ),
      )
    );
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
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              width: double.infinity,
              height: 250.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${fighter.downloads} downloads",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0) ,
                        child: Row(
                          children: List.generate(5, (index) {
                            if (fighter.rate > index){
                              return const Padding(padding: EdgeInsets.symmetric(horizontal:5.0),child: Icon(CustomIcon.star, color: Colors.white, size: 18.0, ));
                            } else {
                              return const Padding(padding: EdgeInsets.symmetric(horizontal:5.0), child: Icon(CustomIcon.star, color: Colors.black26, size: 18.0));
                            }
                          })
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 30.0),
                        width: 84.0,
                        height: 40.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: Colors.white,
                        ),
                        child: Text(NumberFormat.simpleCurrency(decimalDigits: 0).format(fighter.price),
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
                    child: Hero(
                      tag: fighter.heroId,
                      child: CachedNetworkImage(imageUrl: fighter.imageUrl)
                    )
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


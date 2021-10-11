import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:smashbros_app/providers/providers.dart';
import 'package:smashbros_app/utils/custom_icon_icons.dart';


class RateDrag extends StatelessWidget {
  const RateDrag({
    Key? key,
    required FighterProvider fighterProvider,
  }) : _fighterProvider = fighterProvider, super(key: key);

  final FighterProvider _fighterProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0, bottom: 60.0) ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Stars",
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold
            )
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            alignment: Alignment.center ,
            child: RatingBar.builder(
              glow: false,
              initialRating: _fighterProvider.rateValue.toDouble(),
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 10.0),
              itemBuilder: (context, _) => const Icon(
                CustomIcon.star,
                color: Color.fromRGBO(255, 205, 0, 1)
              ),
              onRatingUpdate: (rating) {
                _fighterProvider.rateValue = rating.round();
              },
            ),
          ),
        ],
      ),
    );
  }
}
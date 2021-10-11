import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:smashbros_app/providers/providers.dart';

class PriceSlider extends StatelessWidget {
  const PriceSlider({
    Key? key,

    required FighterProvider fighterProvider,
  }) : _fighterProvider = fighterProvider, super(key: key);

  final FighterProvider _fighterProvider;

  @override
  Widget build(BuildContext context) {

    String _startPrice = NumberFormat.simpleCurrency(decimalDigits: 2).format(_fighterProvider.priceRange.start);
    String _endPrice = NumberFormat.simpleCurrency(decimalDigits: 2).format(_fighterProvider.priceRange.end);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Price",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold
              )
            ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_startPrice, style: const TextStyle(fontSize: 15.0, )),
                Text(_endPrice, style: const TextStyle(fontSize: 15.0, )),
              ],
            ),
          ),
          RangeSlider(
            values: _fighterProvider.priceRange,
            onChanged: (newRange) => _fighterProvider.priceRange = newRange,
            min: _fighterProvider.minMax[0].toDouble(),
            max: _fighterProvider.minMax[1].toDouble(),
            activeColor: const Color.fromRGBO(100, 195, 40, 1),
            inactiveColor: const Color.fromRGBO(182, 182, 182, 1),
            
          ),

        ],
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smashbros_app/providers/providers.dart';
import 'package:smashbros_app/widgets/widgets.dart';


class FilterScreen extends StatelessWidget {
  const FilterScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _fighterProvider = Provider.of<FighterProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Filters", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: TextButton(onPressed: () => Navigator.pop(context), child: const Text("Close", style: TextStyle(color: Colors.black))),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SortWidget(fighterProvider: _fighterProvider,),
              const Divider(thickness: 1.0,),
              PriceSlider(fighterProvider: _fighterProvider),
              const Divider(thickness: 1.0,),
              RateDrag(fighterProvider: _fighterProvider),
              FilterButton(fighterProvider: _fighterProvider)
            ],
          ),
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
    required FighterProvider fighterProvider,
  }) : _fighterProvider = fighterProvider, super(key: key);

  final FighterProvider _fighterProvider;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 54.0,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 39.0,
        child: const Text('Apply Filters',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), 
          color: const Color.fromRGBO(219, 48, 105, 1),
        )
      ),
      onPressed: (){
        Map<String, dynamic> filters = {
          'priceDown' : _fighterProvider.priceRange.start,
          'priceUp'   : _fighterProvider.priceRange.end,
          'rate'      : _fighterProvider.rateValue
        };
        _fighterProvider.filterList(filters);
        _fighterProvider.sortList(_fighterProvider.sortRadio);
        _fighterProvider.activeFilter = true;
        Navigator.of(context).pop();
      }
    );
  }
}
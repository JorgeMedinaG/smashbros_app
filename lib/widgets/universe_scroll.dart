import 'package:flutter/material.dart';
import 'package:smashbros_app/providers/providers.dart';


class UniverseScroll extends StatelessWidget {
  const UniverseScroll({
    Key? key,
    required UniverseProvider universeProvider,
    required FighterProvider fighterProvider,
  }) :   
  _universeProvider = universeProvider,
  _fighterProvider = fighterProvider,
  super(key: key);

  final UniverseProvider _universeProvider;
  final FighterProvider _fighterProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40.0),
      width: double.infinity,
      height: 39,
      child:  ListView.builder(
        physics: const ScrollPhysics(),
        itemCount: _universeProvider.universeList.length,
        scrollDirection: Axis.horizontal,
        controller: ScrollController(),
        itemBuilder: (BuildContext context, int index){

          Universe universe = _universeProvider.universeList[index];
          
          return GestureDetector(
            onTap: () {
              _universeProvider.selectedUniverse = universe;
              if (universe.name == "All"){
                _fighterProvider.getFighterList();
              } else {
                _fighterProvider.getFightersByUniverse(universe.name);
              }
              _fighterProvider.clearFilter();
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              width: 160.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: _universeProvider.selectedUniverse == universe ? const Color.fromRGBO(219, 48, 105, 1) : Colors.white ,
                border: Border.all(
                  color: const Color.fromRGBO(219, 48, 105, 1),
                )
              ),
              child: Center(
                child: Text(universe.name,
                textAlign: TextAlign.center,
                  style: TextStyle(
                    color: (_universeProvider.selectedUniverse == universe) ? Colors.white : const Color.fromRGBO(219, 48, 105, 1),
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
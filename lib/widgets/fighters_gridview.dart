import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smashbros_app/providers/providers.dart';

class FightersGridView extends StatelessWidget {
  const FightersGridView({
    Key? key,
    required FighterProvider fighterProvider,
  }) : _fighterProvider = fighterProvider, super(key: key);

  final FighterProvider _fighterProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 10.0
        ) ,
        itemCount: _fighterProvider.fighterList.length,
        itemBuilder:  (BuildContext context, int index) {
    
          Fighter fighter = _fighterProvider.fighterList[index];
          return GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('details', arguments: fighter),
            child: Column(
              children: [
                Container(
                  height: 142.0,
                  width: 140.0,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(251, 251, 251, 1),
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: const Color.fromRGBO(234, 234, 234, 1) 
                    )  
                  ),
                  child: CachedNetworkImage(
                    //TODO:Placeholder
                    // placeholder: (context, url) => CircularProgressIndicator(),
                    imageUrl: fighter.imageUrl
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 14.0),
                  width: 180.0,
                  height: 40.0,
                  child: Column(
                    children: [
                      Text(fighter.name.toUpperCase(), 
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(fighter.universe.toUpperCase())
                    ],
                  )
                )
              ],
            ),
          );
        }
      ),
    );
  }
}

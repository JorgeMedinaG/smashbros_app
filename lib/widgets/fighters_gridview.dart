import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smashbros_app/providers/providers.dart';

class FightersGridView extends StatelessWidget {
  const FightersGridView({
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

    return Expanded(
      child: RefreshIndicator(
        onRefresh: _onRefresh,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 10.0
          ) ,
          itemCount: _fighterProvider.fighterList.length,
          itemBuilder:  (BuildContext context, int index) {
          
            Fighter fighter = _fighterProvider.fighterList[index];
            return FighterCard(fighter: fighter);
          }
        ),
      ),
    );
  }

  Future<void> _onRefresh() {
    final universe = _universeProvider.selectedUniverse;
    return _fighterProvider.refreshList(universe?.name ?? '');
  } 
}

class FighterCard extends StatelessWidget {
  const FighterCard({
    Key? key,
    required this.fighter,
  }) : super(key: key);

  final Fighter fighter;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('details', arguments: fighter),
      child: Column(
        children: [
          Container(
            height: 152.0,
            width: 150.0,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(251, 251, 251, 1),
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: const Color.fromRGBO(234, 234, 234, 1) 
              )  
            ),
            child: Hero(
              tag: fighter.heroId,
              child: CachedNetworkImage(
                placeholder: (context, url) => Image.asset('assets/img/loading.gif'),
                imageUrl: fighter.imageUrl,
                errorWidget: (context, url, error) => const Icon(Icons.image_not_supported_outlined, size: 100.0),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            width: 180.0,
            child: Column(
              children: [
                Text(fighter.name.toUpperCase(), 
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(fighter.universe.toUpperCase(),overflow: TextOverflow.fade)
              ],
            )
          )
        ],
      ),
    );
  }
}

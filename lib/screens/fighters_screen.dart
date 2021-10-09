import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smashbros_app/providers/providers.dart';
import 'package:smashbros_app/widgets/widgets.dart';


class FightersListScreen extends StatelessWidget {
  const FightersListScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final UniverseProvider _universeProvider = Provider.of<UniverseProvider>(context);
    final FighterProvider _fighterProvider = Provider.of<FighterProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Fighters', 
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.filter_list_outlined, color: Colors.black, size: 28.0))
        ],
      ),
      body: Column(
        children: [
          UniverseScroll(universeProvider: _universeProvider),
          Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 6.0, bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Fighters (${_fighterProvider.fighterList.length})",
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                  width: 185.0,
                  height: 2.0,
                  color: const Color.fromRGBO(151, 151, 151, 1),
                )
              ],
            ),
          ),
          FightersGridView(fighterProvider: _fighterProvider),
          
        ]
      )
    );
  }
}
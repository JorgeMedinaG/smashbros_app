import 'package:flutter_test/flutter_test.dart';

import 'package:smashbros_app/providers/providers.dart';



void main() {

    final fighterProvider = FighterProvider();
  
  test('Fighter filters test', () {
    
    fighterProvider.fighterList = [
      Fighter(objectId: "abc", name: "Samus", universe: "Metroid", price: 604, popular: true, rate: 2, downloads: "6290", description: "", createdAt: "", imageUrl: ""),
      Fighter(objectId: "dbe", name: "Zero Suit Samus", universe: "Metroid", price: 841, popular: true, rate: 5, downloads: "45706", description: "", createdAt: "", imageUrl: ""),
      Fighter(objectId: "fgh", name: "Dark Samus", universe: "Metroid", price: 424, popular: true, rate: 1, downloads: "24099", description: "", createdAt: "", imageUrl: ""),
      Fighter(objectId: "jkl", name: "Ridley", universe: "Metroid", price: 954, popular: true, rate: 5, downloads: "46143", description: "", createdAt: "", imageUrl: ""),
    ];
    
      Map<String, dynamic> filters = {
        'priceDown' : 500,
        'priceUp'   : 800,
        'rate'     : 2
      };

   fighterProvider.activeFilter = true;
   fighterProvider.filterList(filters);

    expect(fighterProvider.fighterList.length, 1);
    expect(fighterProvider.fighterList[0].name, "Samus");
  });

  test('Fighter Sort test', (){

    fighterProvider.fighterList = [
      Fighter(objectId: "abc", name: "Samus", universe: "Metroid", price: 604, popular: true, rate: 2, downloads: "6290", description: "", createdAt: "", imageUrl: ""),
      Fighter(objectId: "dbe", name: "Zero Suit Samus", universe: "Metroid", price: 841, popular: true, rate: 5, downloads: "45706", description: "", createdAt: "", imageUrl: ""),
      Fighter(objectId: "fgh", name: "Dark Samus", universe: "Metroid", price: 424, popular: true, rate: 1, downloads: "24099", description: "", createdAt: "", imageUrl: ""),
      Fighter(objectId: "jkl", name: "Ridley", universe: "Metroid", price: 954, popular: true, rate: 5, downloads: "46143", description: "", createdAt: "", imageUrl: ""),
    ];

      Map<String, dynamic> filters = {
        'priceDown' : 400,
        'priceUp'   : 1000,
        'rate'     : 0
      };
    
    fighterProvider.activeFilter = true;
    fighterProvider.filterList(filters);
    fighterProvider.sortList(SortValues.nameAsc);

    expect(fighterProvider.fighterList[0].name,"Dark Samus" );
    expect(fighterProvider.fighterList[3].name, "Zero Suit Samus");
  });
}
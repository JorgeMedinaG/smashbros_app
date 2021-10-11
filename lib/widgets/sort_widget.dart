import 'package:flutter/material.dart';
import 'package:smashbros_app/providers/providers.dart';

class SortWidget extends StatelessWidget {
  const SortWidget({
    Key? key,
    required FighterProvider fighterProvider,
  }) : _fighterProvider = fighterProvider, super(key: key);

  final FighterProvider _fighterProvider;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Sort by",
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold
            )
          ),
          RadioOption(title: "Ascending", radioValue: SortValues.nameAsc, fighterProvider: _fighterProvider),
          RadioOption(title: "Descending", radioValue: SortValues.nameDesc, fighterProvider: _fighterProvider),
          RadioOption(title: "Rate", radioValue: SortValues.rate, fighterProvider: _fighterProvider),
          RadioOption(title: "Downloads", radioValue: SortValues.downloads, fighterProvider: _fighterProvider),
          
        ],
      ),
    );
  }
}

class RadioOption extends StatelessWidget {
  const RadioOption({
    Key? key,
    required this.title,
    required this.radioValue,
    required FighterProvider fighterProvider,
  }) : _fighterProvider = fighterProvider, super(key: key);

  final String title;
  final SortValues radioValue;
  final FighterProvider _fighterProvider;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Radio(
        value: radioValue,
        groupValue: _fighterProvider.sortRadio,
        onChanged: (SortValues? value) => _fighterProvider.sortRadio = value,
        activeColor: const Color.fromRGBO(100, 195, 40, 1),
      ),
    );
  }
}
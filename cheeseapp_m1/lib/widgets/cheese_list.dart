// flutter and ui libraries
import 'package:flutter/material.dart';
// amplify models that should have been generated for you
import '../models/CheeseRecipe.dart';
// presentational widgets
import 'cheese_item.dart';

class CheeseList extends StatelessWidget {
  final List<CheeseRecipe> cheeses;

  const CheeseList({Key? key, required this.cheeses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cheeses.isNotEmpty
        ? ListView(
            padding: const EdgeInsets.all(8),
            children: cheeses.map((cheese) => CheeseItem(cheese: cheese)).toList())
        : const Center(child: Text('Tap button below to add a todo!'));
  }
}

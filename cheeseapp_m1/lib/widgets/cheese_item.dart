// flutter and ui libraries
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
// amplify packages we will need to use
import 'package:amplify_flutter/amplify.dart';
// amplify models that should have been generated for you
import '../models/CheeseRecipe.dart';

class CheeseItem extends StatelessWidget {
  final double iconSize = 24.0;
  final CheeseRecipe cheese;

  const CheeseItem({Key? key, required this.cheese}) : super(key: key);

  void _deleteCheese(BuildContext context) async {
    try {
      // to delete data from DataStore, we pass the model instance to
      // Amplify.DataStore.delete()
      await Amplify.DataStore.delete(cheese);
    } catch (e) {
      print('An error occurred while deleting Cheese: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        onLongPress: () {
          _deleteCheese(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( cheese.cheeseName,
                      style:
                          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(cheese.cheeseStatus),
                ],
              ),
            ),
            const Icon(
                Icons.expand_more,
//                size: iconSize,
          )]),
        ),
      ),
    );
  }

}
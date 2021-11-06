// dart async library we will refer to when setting up real time updates
// ignore_for_file: avoid_print

import 'dart:async';
// flutter and ui libraries
import 'package:flutter/material.dart';
// amplify packages we will need to use
import 'package:amplify_flutter/amplify.dart';
// amplify configuration and models that should have been generated for you
import '../models/ModelProvider.dart';
import '../models/CheeseRecipe.dart';

class AddCheeseForm extends StatefulWidget {
  const AddCheeseForm({ Key? key }) : super(key: key);

  @override
  _AddCheeseFormState createState() => _AddCheeseFormState();
}

class _AddCheeseFormState extends State<AddCheeseForm> {

  final _nameController = TextEditingController();
  final _mynotesController = TextEditingController();
  final _statusController = TextEditingController();

  Future<void> _saveCheese() async {
    // get the current text field contents
    String name = _nameController.text;
    String mynotes = _mynotesController.text;
    String status = _statusController.text;

    // create a new Cheese from the form values
    CheeseRecipe newCheese = CheeseRecipe(
        cheeseName: name,
        myNotes: mynotes.isNotEmpty ? mynotes : null,
        cheeseStatus: status);

    try {
      // to write data to DataStore, we simply pass an instance of a model to
      // Amplify.DataStore.save()
      await Amplify.DataStore.save(newCheese);

      // after creating a new Cheese, close the form
      Navigator.of(context).pop();
    } catch (e) {
      print('An error occurred while saving Cheese: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Cheese'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(filled: true, labelText: 'Cheese Name')),
              TextFormField(
                  controller: _mynotesController,
                  decoration:
                      const InputDecoration(filled: true, labelText: 'Notes')),
              TextFormField(
                  controller: _statusController,
                  decoration: const InputDecoration(filled: true, labelText: 'Cheese Status')),

              ElevatedButton(onPressed: _saveCheese, child: const Text('Save'))
            ],
          ),
        ),
      ),
      
    );
  }
}
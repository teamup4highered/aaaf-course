import 'dart:async';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import '../models/ModelProvider.dart';
import '../models/CheeseRecipe.dart';
import '../pages/add_cheese_form.dart';
import '../widgets/cheese_list.dart';

class MyCheeseRecipesPage extends StatefulWidget {
  const MyCheeseRecipesPage({Key? key}) : super(key: key);

  @override
  _MyCheeseRecipesPageState createState() => _MyCheeseRecipesPageState();
}

class _MyCheeseRecipesPageState extends State<MyCheeseRecipesPage> {
  // subscription to CheeseRecipes model update recipes - to be initialized at runtime
  late StreamSubscription _subscription;

  // loading ui state - initially set to a loading state
  bool _isLoading = true;

  // list of CheeseRecipes - initially empty
  List<CheeseRecipe> _cheeses = [];


  @override
  void initState() {
    super.initState();
    _initializeCheeseList();
  }

  @override
  void dispose() {
    // cancel the subscription when the state is removed from the tree
    _subscription.cancel();
    super.dispose();
  }

  Future<void> _initializeCheeseList() async {
    // listen for updates to CheeseRecipe entries by passing the CheeseRecipe classType to
    // Amplify.DataStore.observe() and when an update event occurs, fetch the
    // cheese list
    //
    // note this strategy may not scale well with larger number of entries
    _subscription = Amplify.DataStore.observe(CheeseRecipe.classType).listen((event) {
      _fetchCheeses();
    });

    // fetch Todo entries from DataStore
    await _fetchCheeses();

    // after both configuring Amplify and fetching Todo entries, update loading
    // ui state to loaded state
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _fetchCheeses() async {
    try {
      // query for all CheeseRecipes entries by passing the CheeseRecipe classType to
      // Amplify.DataStore.query()
      List<CheeseRecipe> updatedCheeses = await Amplify.DataStore.query(CheeseRecipe.classType);

      // update the ui state to reflect fetched cheeses
      setState(() {
        _cheeses = updatedCheeses;
      });
    } catch (e) {
      throw('An error occurred while querying CheeseRecipe: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cheese'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : CheeseList(cheeses: _cheeses),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddCheeseForm()),
          );
        },
        tooltip: 'Add Recipe',
        label: Row(
          children: const [Icon(Icons.add), Text('Add Cheese')],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,      
    );
  }
}
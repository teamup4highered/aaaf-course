import 'package:flutter/material.dart';
import 'pages/my_cheese_recipes_page.dart';
import 'pages/loading_page.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_api/amplify_api.dart';
//import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import '../amplifyconfiguration.dart';
import '../models/ModelProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 // loading ui state - initially set to a loading state
  bool _isLoading = true;

    // amplify plugins
  final AmplifyAPI _apiPlugin = AmplifyAPI();
  //final AmplifyAuthCognito _authPlugin = AmplifyAuthCognito();
  final AmplifyDataStore _dataStorePlugin =
      AmplifyDataStore(modelProvider: ModelProvider.instance);


 @override
  void initState() {
    // kick off app initialization

    super.initState();
     _initializeApp();
  }

     Future<void> _initializeApp() async {
    // configure Amplify
    await _configureAmplify();

    // after configuring Amplify, update loading
    // ui state to loaded state
    setState(() {
      _isLoading = false;
    });
  }
 
  Future<void> _configureAmplify() async {
    try {
      // add Amplify plugins
      //await Amplify.addPlugins([_dataStorePlugin, _apiPlugin, _authPlugin]);
      await Amplify.addPlugins([_dataStorePlugin, _apiPlugin,]);

      // configure Amplify
      //
      // note that Amplify cannot be configured more than once!
      await Amplify.configure(amplifyconfig);
    } catch (e) {
      // error handling can be improved for sure!
      // but this will be sufficient for the purposes of this tutorial
      throw('An error occurred while configuring Amplify: $e');
    }
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cheese App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: _isLoading
          ? const LoadingPage()
          : const MyCheeseRecipesPage(),
    );
  }
}


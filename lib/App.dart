
import 'package:flutter/material.dart';
import 'Helpers/AppNavigations/NavigationConfig.dart';
import 'Helpers/AppNavigations/NavigationHelpers.dart';

//Create a class with a name App which extends StatelessWidget
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    //return MaterialApp
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      // Set the onGenerateRoute and pass the function signature of the initial page as homeScreenConfig and the initialPageData as null.
      onGenerateRoute: AppRoute(
        initialPage: Pages.homeScreenConfig,
        initialPageData: "",
      ).onGenerateRoute,
    );
  }
}
  
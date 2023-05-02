import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'App.dart';
import 'BOs/AvengerBO/AvengerBO.mapper.g.dart';
import 'Services/AvengerServices/AvengerService.dart';
import 'Services/AvengerServices/IAvengerService.dart';
import 'main.reflectable.dart';

/* Create a main method */
void main() {

  /* Call the method initializeReflectable()*/
  initializeReflectable();

  /* Call the method initializeJsonMapper()*/
  initializeJsonMapper();

  //
  GetIt.instance.registerSingleton<IAvengerService>(AvengerService());

  // Call the 
  runApp(const App());
}

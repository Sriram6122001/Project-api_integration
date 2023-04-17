import 'package:dart_json_mapper/dart_json_mapper.dart';

// Create a class with a name AvengerBO 
@jsonSerializable
class AvengerBO {

  // Declare a variable of type int with the name id as null.
  int? id;

  // Declare a variable of type String with named as name as null.
  String? name;

  // pass the variables to the constructor.
  AvengerBO({required this.id, required this.name});
}


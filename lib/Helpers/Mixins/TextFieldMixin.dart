import 'dart:async';
// Create a abstract class named ITextFieldMixin
abstract class ITextFieldMixin{}

// Create a class named ShowIPopUp which inherits IPopUpMixin
class TextField extends ITextFieldMixin{

// Declare a variable named data of type String
String data;

// Invoke the variable named message in the constructor
TextField({required this.data});
}

// Create a mixin named TextFieldMixin
mixin TextFieldMixin
{

  // Create a instance for the StreamController with a name TextStreamController of type class.
  StreamController<TextField> TextStreamController = StreamController<TextField>();

  /* Create a method named addText with a named parameter as required with variable as event of type class. */
  void addText({required TextField event})
  {
    // Add the event to the TextStreamController
    TextStreamController.add(event);
  }

 /* Create a method named ClosePopUp as asynchronous */
  void closeText()async{
   
   // Close the TextStreamController and make it as await.
    await TextStreamController.close();
  }
}

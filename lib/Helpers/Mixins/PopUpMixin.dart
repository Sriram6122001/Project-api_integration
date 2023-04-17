import 'dart:async';

// Create a abstract class named IPopUpMixin
abstract class IPopUpMixin{}

// Create a class named ShowIPopUp which inherits IPopUpMixin
class ShowIPopUp extends IPopUpMixin{

// Declare a variable named message of type String
dynamic data;

// Invoke the variable named message in the constructor
ShowIPopUp({required this.data});
}

// Create a mixin named PopUpMixin
mixin PopUpMixin
{
  // Create a instance for the StreamController with a name PopUpNameController of type class.
  StreamController<IPopUpMixin> PopUpNameController = StreamController<IPopUpMixin>();
   
   /* Create a method named AddPopUp with a named parameter as required with variable as event of type class. */
   void AddPopUp({required IPopUpMixin event})
   {

    // Add the event to the PopUpNameController
    PopUpNameController.add(event);
   }


   /* Create a method named ClosePopUp as asynchronous */
   void ClosePopUp() async
   {
     // Close the PopUpNameController and make it as await.
     await PopUpNameController.close();
   }
}



import 'package:api_integration/BO/AvengerBO/AvengerBO.dart';
import 'package:api_integration/Helpers/Mixins/PopUpMixin.dart';
import 'package:api_integration/Helpers/Utitilites/Utilities.dart';
import 'package:api_integration/Pages/HomeScreen/HomeScreenModel.dart';
import '../../Helpers/AppNavigations/NavigationMixin.dart';

class HomeScreenVM extends HomeScreenModel {

/* Create a asynchronous method named fetchAllAvengers() of type Future<void>, to Get All Avengers from service */
Future<void> fetchAllAvengers() async {
    try {
      setIsAvengersLoading(isLoading: true);
      var data = await avengerServiceInstance.getAllAvengers();
      setAllAvengers(newAvengers: data.content ?? []);
      setIsAvengersLoading(isLoading: false);
    } 

    // Catch Block
    catch (e) {

      // Prints the Exception.
      e.writeExceptionData();
    }
  }


/* Create a method with a name as navigateToPreviousScreen of return type void.*/
 void navigateToPreviousScreen()
{
  // Add the NavigatorPop() to the navigationStream.
  navigationStream.add(NavigatorPop());
}

/* Create a method with the name getInputFromUser */
void getInputFromUser()
{

  // Try block
  try{

  /* call the method AddPopUP and the constructor of the class ShowIPopUp to the parameter named event */
  AddPopUp(event: ShowIPopUp(data: [0,"showPopupCreate"]));
  }

  // Catch Block
  catch(e)
    {
      // Prints the Exception.
      e.writeExceptionData();
  }
}

/* Create a asynchronous method named fetchAllAvengers() of type Future<void>, to create All Avengers from service */
Future<void> createANewAvenger({required String nameOfAvenger})async
  {
    try {

      /* Call the method navigateToPreviousScreen */
      navigateToPreviousScreen();
      
      setIsAvengersLoading(isLoading: true);
      // Assign the constructor of AvengerBO to the variable named _editAvenger of type AvengerBO.
      AvengerBO _newAvenger = AvengerBO(id: null, name: nameOfAvenger);

      // Create a variable with a name data to call the service CreateNewAvenger using the instance.
      var data= avengerServiceInstance.createNewAvenger(nameOfHero: _newAvenger);
      
      /* Call the method fetchAllAvengers */
      await fetchAllAvengers();
      
  }
    // Catch Block
    catch(e)
    {
      // Prints the Exception.
      e.writeExceptionData();
    }
      
  }

 /* Delete allAvenger form service */
  Future<void> deleteAvenger({required int index})async
  {
    try {
      // Assign the constructor of AvengerBO to the variable named _deleteAvenger of type AvengerBO.
      AvengerBO _deleteAvenger = AvengerBO(id: allAvengers[index].id, name: null);

      // Create a variable with a name data to call the service deleteHeroFromAvenger using the instance.
      var data = avengerServiceInstance.deleteHeroFromAvenger(hero: _deleteAvenger);

      /* Call the fetchAllAvengers() */
      await fetchAllAvengers();
      
    }
    // Catch Block
    catch(e)
    {
      // Prints the Exception.
      e.writeExceptionData();
    }
  }

  /* Edit allAvenger form service */
  Future<void> editAvenger({required int index, required String name})async
  {
    try {
      
      /* Call the method navigateToPreviousScreen() */
      navigateToPreviousScreen();
  
      setIsAvengersLoading(isLoading: true);

      // Assign the constructor of AvengerBO to the variable named _editAvenger of type AvengerBO.
      AvengerBO _editAvenger = AvengerBO(id:allAvengers[index].id,name: name);

      // Create a variable with a name data to call the service editNameOfAvenger using the instance.
      var data= avengerServiceInstance.editNameOfAvenger(hero: _editAvenger);

      /* Call the method fetchallAvengers().*/
      await fetchAllAvengers();
     
    }
    // Catch Block
    catch(e)
    {
      // Prints the Exception.
      e.writeExceptionData();
    }
  }

/* Create a void method with the name editDisplay with the named parameter with variable named  */
Future<void> editDisplay({required int index})async
{
  // Try block
  try{

    /* call the method AddPopUP and the constructor of the class ShowIPopUp to the parameter named event */
    AddPopUp(event: ShowIPopUp(data: [index,"editAvenger"]));

  }

  // Catch Block
  catch(e)
  {
    // Prints the Exception.
    e.writeExceptionData();
  }
}

Future<void> showPop()async
{
  AddPopUp(event: ShowIPopUp(data: [null,"showUserPopUp"]));
}

}

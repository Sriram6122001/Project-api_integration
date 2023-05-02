// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variabl
import 'package:api_integration/Helpers/AppNavigations/NavigationHelpers.dart';
import 'package:api_integration/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:api_integration/Pages/HomeScreen/HomeScreenVM.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Helpers/Mixins/PopUpMixin.dart';

// Create a StatefulWidget with a name HomeScreen
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.extraData}) : super(key: key);

  // Create a Object with a name extraData as final
  final Object extraData;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Create a instance _homeScreenVM for the class HomeScreenVM as final.
  final HomeScreenVM _homeScreenVM = HomeScreenVM();

  // Create a instance _textEditingController for the TextEditingController as final.
  final TextEditingController _textEditingController=TextEditingController();

  /* Declare the initState method */
  @override
  void initState() {

    // Invoke the initstate of parent class.
    super.initState();

    _homeScreenVM.fetchAllAvengers();

    // Using the instance access the PopUpNameController and access the Stream and listen the event
    _homeScreenVM.PopUpNameController.stream.listen((event) {

      // Check whether the event is ShowIPopUp
      if(event is ShowIPopUp)
      {

        // Use Switch case check event.data
        switch(event.data[1])
        {

          // Check whether the event.data is showPopUpCreate
          case "showUserPopUp":{
            
            _textEditingController.text="";
            // Call the method showUserPopUp
            showPopUpForCreate();

            // break the statement
            break;
          }

          // Check whether the event.data is editAvenger
          case "editAvenger":{
            _textEditingController.text=_homeScreenVM.allAvengers[event.data[0]].name!;

            /* call the method showNewPopUp and pass the value clickedInded by using the instance to the named paramter named index */
            showPopUpForEdit(index:event.data[0]);

            // break the statement
            break;
          }
        }
      }
    });

     // Using the instance access the navigationStream and access the Stream and listen the event
    _homeScreenVM.navigationStream.stream.listen((event) {

      // Check whether the event is NavigatorPop
      if(event is NavigatorPop)
      {

        // Pop the context with the data and checkMounted
        context.pop(data: event.data,checkMounted: event.checkMounted);
      }
     });

    // Using the instance access the TextStreamController and access the Stream and listen the event
     _homeScreenVM.TextStreamController.stream.listen((event) { 

    // Check whether the event is TextField
    if( event is TextField)
    {
      // Assign the event.data to the instance _textEditingController.text
      _textEditingController.text= event.data;

      // Assign the TextSelection.collapsed(offset:_textEditingController.text.length) to the _textEditingController.selection
      _textEditingController.selection = TextSelection.collapsed(offset:
       _textEditingController.text.length);
    }
  });
}

/* Declare dispose method */
@override
void dispose()
{
  // Using the instance _textEditingController,call the method dispose().
  _textEditingController.dispose();

  // Using the instance _homeScreenVM,call the method dispose().
  _homeScreenVM.dispose();

  // Using the super keyword call the dispose method.
  super.dispose();
}

/* Create a Future method of type void with the name showUserPopUp  */
Future<void> showPopUpForCreate()async
{
  await showDialog(
    context: context,
    barrierDismissible: false,
     builder: (context)
     {
      return AlertDialog(
        title: Text("Create New Avenger",style: GoogleFonts.arima(),),
        content: SizedBox(
          height: 150,
          width:100,
        child: TextFormField(
          controller: _textEditingController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
            hintText: "Enter the Name",
            label: Text("Name",style: GoogleFonts.arima()),
            constraints: BoxConstraints(maxHeight: 50,maxWidth: 100)
          ),
        ),
        ),
        actions: [
          ElevatedButton(onPressed: (){

            //Using the instance _homeScreenVM call the method navigateToPreviousScreen()
            _homeScreenVM.navigateToPreviousScreen();
          },
          child: Text("Cancel",style: GoogleFonts.arima())),
           ElevatedButton(onPressed: (){
            
            //Using the instance _homeScreenVM call the method createANewAvenger and the _textEditingController.text to the parameter nameOfAvenger.
            _homeScreenVM.onClickCreateAvenger(nameOfAvenger: _textEditingController.text.toString());

            //Using the instance _homeScreenVM call the method fetchAllAvengers()
            _homeScreenVM.fetchAllAvengers();
          },
          child: Text("save",style: GoogleFonts.arima())),
        ],
      );
     });
}


Future<void> showPopUpForEdit({required int index})async
{
  await showDialog(
    context: context,
    barrierDismissible: false,
     builder: (context)
     {
      return AlertDialog(
        title: Text("Edit your Name",style: GoogleFonts.arima()),
        content: SizedBox(
          height: 150,
          width:100,
        child: TextFormField(
          controller: _textEditingController,
          onChanged: (text)=>_homeScreenVM.onChange(text: text),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
            constraints: BoxConstraints(maxHeight: 50,maxWidth: 100)
          ),
        ),
        ),
        actions: [
          ElevatedButton(onPressed: (){

             //Using the instance _homeScreenVM call the method navigateToPreviousScreen()
            _homeScreenVM.navigateToPreviousScreen();
          },
          child: Text("Cancel",style: GoogleFonts.arima())),
          ElevatedButton(onPressed: (){

            //Using the instance _homeScreenVM call the method editAvenger and pass the parameter index as index and _textEditingController.text to the parameter name.
            _homeScreenVM.onClickEditAvenger(index: index,name:_textEditingController.text);
          },
          child: Text("save",style: GoogleFonts.arima())),
          
        ],
      );
     });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
        backgroundColor: Color(0xffBA90C6),
        actions: const [],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {

          // Using the instance _homeScreenVM, call the method getInputFromUser()
         _homeScreenVM.showPop();

          // Using the _textEditingController clear the text.
          _textEditingController.text="";
          },
        
          ),
      body: Column(
        children: [
          Observer(
            builder: (context) {

              // Return visibility
              return Visibility(

                // By using the instance _homeScreenVM get the isAvengersLoading and assign it to visible.
                visible: _homeScreenVM.isAvengersLoading,
                child: const LinearProgressIndicator(),
              );
            },
          ),
          Expanded(
            child: Observer(builder: (context) {
              return Visibility(
                visible: !_homeScreenVM.isAvengersLoading,
                child: ListView.builder(
                  itemCount: _homeScreenVM.allAvengers.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return ListTile(
                      leading:
                          Text(_homeScreenVM.allAvengers[index].id.toString()),
                      title: Text(_homeScreenVM.allAvengers[index].name ?? ""),
                      trailing: SizedBox(
                        height: 50,
                        width:100,
                        child: Row(children: [
                            IconButton(onPressed:(){
                              
                              // Using the instance _homeScreen call the method editDisplay and pass the index as index.
                              _homeScreenVM.editDisplay(index: index);},
                               icon:Icon(Icons.edit),color: Colors.blueAccent,),
                            IconButton(onPressed:(){
                              
                              // Using the instance _homeScreen call the method deleteAvenger and pass the index as index.
                              _homeScreenVM.onClickDeleteAvenger(index: index);}, icon:Icon(Icons.delete),color:Colors.redAccent)
                        ]),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        
          
        ],
      ),
    );


  }
}

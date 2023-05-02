import 'dart:io';
import 'package:api_integration/Helpers/APIHandlerHelper/APIHandlerHelper.dart';
import 'package:api_integration/BOs/AvengerBO/AvengerBO.dart';
import 'package:api_integration/Helpers/AppConstants/AppConstants.dart';
import 'package:api_integration/Helpers/Utitilites/Utilities.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'IAvengerService.dart';

import "package:dio/dio.dart";

// Create a class with the name AvengerService which implements the class IAvengerService
class AvengerService implements IAvengerService {

  // Create a variable with the name _dio of type Dio and assign the constructor of Dio 
  final Dio _dio =
      Dio(BaseOptions(baseUrl: AppConstants.avengerServiceBaseUrl));


 /* Create a method with a name CreateNewAvenger of type Future */
  @override
  Future<ServiceResult<AvengerBO>> createNewAvenger(
      {required AvengerBO nameOfHero})async {

    // Try block
    try{

        // Create a variable named dataSent which serializes the variable nameOfHero.
        var datatoBeSent = JsonMapper.serialize(nameOfHero);

        // Create a variable named resposeFromServer which edit the data from the api using the post command.
        var responseFromServer= await _dio.post(AppConstants.avengerServiceCreateNewHeroEndPoint,
        data: datatoBeSent );

        // Check Whether the statusCode of responseFromServer equal to 201
        if(responseFromServer.statusCode==201)
        {
          // Returns ServiceResult
          return ServiceResult(

            // Assign the HttpStatusCode as OK to the statusCode.
            statusCode: HttpStatusCode.OK,

            // Assign the string "Sucessfully Created new hero" as message to the message.
            message: "Sucessfully Created new hero",

            // Create a variable with a name content and assign the data of the responseFromServer.
            content: JsonMapper.deserialize(responseFromServer.data),
            );
        }

        // Else the condition is not true
        else{

          // Returns ServiceResults
          return ServiceResult(

            // Assign the HttpStatusCode as BadRequest to the statusCode.
            statusCode: HttpStatusCode.BadRequest,

            // Assign the string "The type of data got is incorrect!" as message to the message.
            message: "Error in the creation of new hero"
            );
        }
    }

    // In on Block, create FormatException
    on FormatException {

      // Returns ServicesResult
      return ServiceResult(

        // Assign the HttpStatusCode as Forbidden to the statusCode.
        statusCode: HttpStatusCode.Forbidden,

        // Assign the string "The type of data got is incorrect!" as message to the message.
        message: "The type of data got is incorrect!",
      );
    } 
    
    // In on Block, create FormatException
    on SocketException {

      // Returns ServicesResult
      return ServiceResult(

        // Assign the HttpStatusCode as NetworkFailure to the statusCode.
        statusCode: HttpStatusCode.NetworkFailure,

        // Assign the string "There is not internet connection!" as message to the message.
        message: "There is not internet connection!",
      );
    } 
    
    // Catch block
    catch (e) {

      // Prints the Exception
      e.writeExceptionData();

      // Returns ServicesResult
      return ServiceResult(

        // Assign the HttpStatusCode as SystemException to the statusCode.
        statusCode: HttpStatusCode.SystemException,

        // Print the exception as message. 
        message: e.toString(),
      );
    }
  }

  /* Create a method with a name deleteHeroFromAvenger of type Future */
  @override
  Future<ServiceResult<List<AvengerBO>>> deleteAvenger(
      {required AvengerBO hero})async {

    //try block
    try {
      // Create a variable named resposeFromServer which delete the data from the api using the delete command.
      var resposeFromServer =
          await _dio.delete("${AppConstants.avengerServiceEditHeroEndPoint}/${hero.id}");

      // Check Whether the statusCode of responseFromServer equal to 200
      if (resposeFromServer.statusCode == 200) {

        // Create a variable with a name content and assign the data of the responseFromServer.
        var content = resposeFromServer.data;

        // Create a list of type AvengerBO with the name as finalContent.
        List<AvengerBO> finalContent = [];

        // Check whether the content is in the List.
        if (content is List) {

          // Using the for loop for iteration.
          for (var element in content) {

            // Create a variable with a name instance and assign JsonMapper.deserialize<AvengerBO>(element).
            var instance = JsonMapper.deserialize<AvengerBO>(element);

            // Check whether the instance not equal to null
            if (instance != null) {

              // Add the variable named instance to the list finalContent.
              finalContent.add(instance);
            }
          }
        }

        // returns ServiceResult
        return ServiceResult(

            // Assign the HttpStatusCode as OK to the statusCode.
            statusCode: HttpStatusCode.OK,

            // Assign finalContent to the content.
            content: finalContent,

            // Assign the string "Data edited Successfully" as message to the message.
            message: "Data deleted Successfully");
      }

      // returns ServiceResult
      return ServiceResult(

        // Assign the HttpStatusCode as Conflict to the statusCode.
        statusCode: HttpStatusCode.Conflict,

        // Assign Content as Empty.
        content: [],

        // Assign the string "Data has been got" as message to the message.
        message: "Data has been got",
      );
    } 
    
    // In on Block, create FormatException
    on FormatException {

      // returns ServiceResult
      return ServiceResult(

        // Assign the HttpStatusCode as Forbidden to the statusCode.
        statusCode: HttpStatusCode.Forbidden,

        // Assign Content as Empty.
        content: [],

        // Assign the string "The type of data got is incorrect!" as message to the message.
        message: "The type of data got is incorrect!",
      );
    } 

    // In on Block, create SocketException
    on SocketException {

      // returns ServiceResult
      return ServiceResult(

        // Assign the HttpStatusCode as NetworkFailure to the statusCode.
        statusCode: HttpStatusCode.NetworkFailure,

        // Assign Content as Empty
        content: [],

        // Assign the string "There is not internet connection!" as message to the message
        message: "There is not internet connection!",
      );
    } 
    // Catch block
    catch (e) {

      // Prints the Exception
      e.writeExceptionData();

      // returns ServiceResult
      return ServiceResult(

        // Assign the HttpStatusCode as SystemException to the statusCode.
        statusCode: HttpStatusCode.SystemException,

        // Assign Content as Empty
        content: [],

        // Print the exception as message.
        message: e.toString(),
      );
    }
  }

/* Create a method with a name editNameOfAvenger of type Future */
  @override
  Future<ServiceResult<List<AvengerBO>>> editAvenger(
      {required AvengerBO hero})async {
    // Try Block
    try {

      // Create a variable named dataSent which serializes the variable hero.
      var dataSent = JsonMapper.serialize(hero);

      // Create a variable named resposeFromServer which edits the data from the api using the put command.
      var resposeFromServer =
          await _dio.put("${AppConstants.avengerServiceEditHeroEndPoint}/${hero.id}",data: dataSent);
          
      // Check Whether the statusCode of responseFromServer equal to 200 
      if (resposeFromServer.statusCode == 200) {

        // Create a variable with a name content and assign the data of the responseFromServer.
        var content = resposeFromServer.data;

        // Create a list of type AvengerBO with the name as finalContent.
        List<AvengerBO> finalContent = [];

        // Check whether the content is in the List.
        if (content is List) {

          // Using the for loop for iteration.
          for (var element in content) {

            // Create a variable with a name instance and assign JsonMapper.deserialize<AvengerBO>(element).
            var instance = JsonMapper.deserialize<AvengerBO>(element);

            // Check whether the instance not equal to null
            if (instance != null) {

              // Add the variable named instance to the list finalContent.
              finalContent.add(instance);
            }
          }
        }

        // returns ServiceResult
        return ServiceResult(

            // Assign the HttpStatusCode as OK to the statusCode.
            statusCode: HttpStatusCode.OK,

            // Assign finalContent to the content.
            content: finalContent,

            // Assign the string "Data edited Successfully" as message to the message.
            message: "Data edited Successfully");
      }

      // returns ServiceResult
      return ServiceResult(

        // Assign the HttpStatusCode as Conflict to the statusCode.
        statusCode: HttpStatusCode.Conflict,

        // Assign Content as Empty.
        content: [],

        // Assign the string "Data has been got" as message to the message.
        message: "Data has been got",
      );
    }
    
    // In on Block, create FormatException
     on FormatException {

      // Returns ServiceResult
      return ServiceResult(

        // Assign the HttpStatusCode as Forbidden to the statusCode.
        statusCode: HttpStatusCode.Forbidden,

        // Assign Content as Empty.
        content: [],

        // Assign the string "The type of data got is incorrect!" as message to the message.
        message: "The type of data got is incorrect!",
      );
    } 
    
    // In on Block, create SocketException
    on SocketException {

      // Returns ServiceResult
      return ServiceResult(

        // Assign the HttpStatusCode as NetworkFailure to the statusCode.
        statusCode: HttpStatusCode.NetworkFailure,

        // Assign Content as Empty
        content: [],

        // Assign the string "There is not internet connection!" as message to the message
        message: "There is not internet connection!",
      );
    }
    
     // catch block
     catch (e) {

      // Prints the exception
      e.writeExceptionData();

      // Returns ServiceResult
      return ServiceResult(

        // Assign the HttpStatusCode as SystemException to the statusCode.
        statusCode: HttpStatusCode.SystemException,

        // Assign Content as Empty
        content: [],

        // Print the exception as message.
        message: e.toString(),
      );
    }
  }

/* Create a method with a name getAllAvengers of type Future */
  @override
  Future<ServiceResult<List<AvengerBO>>> getAllAvengers() async {

    // Try Block
    try {

      // Create a variable named resposeFromServer which Gets the data from the api using the get command.
      var resposeFromServer =
          await _dio.get(AppConstants.avengerServiceGetAllAvengerEndPoint);

      // Check Whether the statusCode of responseFromServer equal to 200
      if (resposeFromServer.statusCode == 200) {

        // Create a variable with a name content and assign the data of the responseFromServer.
        var content = resposeFromServer.data;

        // Create a list of type AvengerBO with the name as finalContent.
        List<AvengerBO> finalContent = [];

        // Check whether the content is in the List.
        if (content is List) {

          // Using the for loop for iteration.
          for (var element in content) {

            // Create a variable with a name instance and assign JsonMapper.deserialize<AvengerBO>(element).
            var instance = JsonMapper.deserialize<AvengerBO>(element);

            // Check whether the instance not equal to null
            if (instance != null) {

              // Add the variable named instance to the list finalContent.
              finalContent.add(instance);
            }
          }
        }

        // Returns ServiceResult
        return ServiceResult(

            // Assign the HttpStatusCode as OK to the statusCode.
            statusCode: HttpStatusCode.OK,

            // Assign finalContent to the content.
            content: finalContent,

            // Assign the string "Data got Successfully" as message to the message.
            message: "Data got Successfully");
      }
      // Return ServiceResult
      return ServiceResult(

        // Assign the HttpStatusCode as Conflict to the statusCode.
        statusCode: HttpStatusCode.Conflict,

        // Assign Content as Empty.
        content: [],

        // Assign the string "Data has been got" as message to the message.
        message: "Data has been got",
      );
    }
     
     // In on Block, create FormatException
     on FormatException {

      // Return ServiceResult
      return ServiceResult(

        // Assign the HttpStatusCode as Forbidden to the statusCode.
        statusCode: HttpStatusCode.Forbidden,

        // Assign Content as Empty.
        content: [],

        // Assign the string "The type of data got is incorrect!" as message to the message.
        message: "The type of data got is incorrect!",
      );
    }
    
    // In on Block, create SocketException
     on SocketException {

      // Return ServiceResult
      return ServiceResult(

        // Assign the HttpStatusCode as NetworkFailure to the statusCode.
        statusCode: HttpStatusCode.NetworkFailure,

        // Assign Content as Empty.
        content: [],

        // Assign the string "There is not internet connection!" as message to the message.
        message: "There is not internet connection!",
      );
    } 
    // Catch block
    catch (e) {

      // Prints the exception
      e.writeExceptionData();

      // Returns ServiceResult
      return ServiceResult(

        // Assign the HttpStatusCode as SystemException to the statusCode.
        statusCode: HttpStatusCode.SystemException,

        // Assign Content as Empty.
        content: [],

        // Print the exception as message.
        message: e.toString(),
      );
    }
  }
}

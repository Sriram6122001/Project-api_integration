import 'package:api_integration/BO/AvengerBO/AvengerBO.dart';
import 'package:api_integration/Helpers/Mixins/PopUpMixin.dart';
import 'package:api_integration/Helpers/Mixins/TextFieldMixin.dart';
import 'package:api_integration/Services/AvengerServices/IAvengerService.dart';
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import '../../Helpers/AppNavigations/NavigationMixin.dart';
part 'HomeScreenModel.g.dart';

// Create a class named HomeScreenModel and assign _HomeScreenModelBase with the mixins _$HomeScreenModel,PopUpMixin,TextFieldMixin,NavigationMixin
class HomeScreenModel = _HomeScreenModelBase with _$HomeScreenModel,PopUpMixin,TextFieldMixin,NavigationMixin;

// Create a abstract class named _HomeScreenModelBase and add the mixin named Store.
abstract class _HomeScreenModelBase with Store {

  // Create a variable type IAvengerService as final and assign the instance of IAvengerService by using the GetIt
  final avengerServiceInstance = GetIt.instance.get<IAvengerService>();
  
  // Create a observable list of type AvengerBO with the name allAvengers and initialize it as empty.
  @observable
  List<AvengerBO> allAvengers = [];

  // Create a observable variable with the name isAvengersLoading fo type boolean and assign the value as false.
  @observable
  bool isAvengersLoading = false;

  @observable
  String textValue="";
  
  @observable
  int index=0;

  /* Create a void method with the name setIsAvengersLoading with the named parameter has variable named isLoading of type bool */
  @action
  void setIsAvengersLoading ({required bool isLoading}){
    isAvengersLoading = isLoading;
  }

  /* Create a void method with the name setIsAvengersLoading with the named parameter has variable named isLoading of type bool */
  @action
  void setAllAvengers({required List<AvengerBO> newAvengers}) {
    allAvengers = [];
    allAvengers = newAvengers;
  }

  
}

import 'package:api_integration/Helpers/APIHandlerHelper/APIHandlerHelper.dart';
import 'package:api_integration/BOs/AvengerBO/AvengerBO.dart';
import 'package:api_integration/Services/AvengerServices/IAvengerService.dart';

class MockAvengerService implements IAvengerService {
  @override
  Future<ServiceResult<AvengerBO>> createNewAvenger(
      {required AvengerBO nameOfHero}) {
    // TODO: implement createNewAvenger
    throw UnimplementedError();
  }

  @override
  Future<ServiceResult<List<AvengerBO>>> deleteAvenger(
      {required AvengerBO hero}) {
    // TODO: implement deleteHeroFromAvenger
    throw UnimplementedError();
  }

  @override
  Future<ServiceResult<List<AvengerBO>>> editAvenger(
      {required AvengerBO hero}) {
    // TODO: implement editNameOfAvenger
    throw UnimplementedError();
  }

  @override
  Future<ServiceResult<List<AvengerBO>>> getAllAvengers() async {
    // TODO: implement getAllAvengers
    return ServiceResult(statusCode: HttpStatusCode.OK, content: [
      AvengerBO(id: 1, name: "wefrfefrv"),
      AvengerBO(id: 2, name: "wefrfefrv"),
      AvengerBO(id: 3, name: "wefrfefrv"),
      AvengerBO(id: 4, name: "wefrfefrv"),
      AvengerBO(id: 5, name: "wefrfefrv"),
    ]);
  }
}

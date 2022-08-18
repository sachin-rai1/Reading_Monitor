import 'package:get/get.dart';
import 'GetXNetworkManagement.dart';

class NetworkBinding extends Bindings{

  // dependence injection attach our class.
  @override
  void dependencies() {

    Get.lazyPut<GetXNetworkManager>(() => GetXNetworkManager());
  }

}
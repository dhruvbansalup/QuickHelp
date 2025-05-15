
import 'package:get/get.dart';

class ListServiceRequestsController extends GetxController{
  // Singleton pattern to ensure only one instance of the controller exists
  static ListServiceRequestsController get instace => Get.find();
  

  final requestStatus='new'.obs;
}
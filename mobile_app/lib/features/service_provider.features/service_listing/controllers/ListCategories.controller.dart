import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quick_help/utils/constants/api_endpoints.dart';

class ListServiceCategories extends GetxController {
  // Singleton pattern to ensure only one instance of the controller exists
  static ListServiceCategories get instance => Get.find();

  final RxList<String> serviceCategories = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchServiceCategories();
  }

  Future<void> fetchServiceCategories() async {
    final response = await http.get(
      Uri.parse(QApiEndpoints.serviceCategories!),
    );
    if (response.statusCode == 200) {
      // Handle success
      final Map<String, dynamic> decodedBody = json.decode(response.body);
      List<dynamic> data = decodedBody['categories'];
      serviceCategories.assignAll(data.cast<String>());
    } else {
      // Handle error
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kisanseva/models/rent_tools_model.dart';

class DisplayRentToolsCtrl extends GetxController {
  RentToolsModel rentToolsModel = RentToolsModel();
  final isLoading = false.obs;
  final selectedCategory = "All".obs;
  Query query;
  rentToolsStrems() {
    // return Firestore.instance.collection('rentTools').document().snapshot;
    if (selectedCategory.value == "All") {
      return Firestore.instance.collection('rentTools').snapshots();
    } else if (selectedCategory.value == "Tractors") {
      return Firestore.instance.collection('rentTools').where('category', isEqualTo:rentToolsModel.toolType);
    }
  }
}

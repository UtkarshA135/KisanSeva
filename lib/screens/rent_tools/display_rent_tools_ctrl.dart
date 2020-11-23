import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kisanseva/models/rent_tools_model.dart';
import 'package:logger/logger.dart';

class DisplayRentToolsCtrl extends GetxController {
  RentToolsModel rentToolsModel = RentToolsModel();
  final isLoading = false.obs;
  final selectedCategory = "All".obs;
  Query query;
  final logger = Logger();
  rentToolsStrems() {
    // return Firestore.instance.collection('rentTools').document().snapshot;
    if (selectedCategory.value == "All") {
      logger.d("insie if");
      return Firestore.instance.collection('rentTools').snapshots();
    } else if (selectedCategory.value == "Tractors") {
      logger.d("insie else if selectedCategory.value Tractors");
      return Firestore.instance
          .collection('rentTools')
          .where('toolType', isEqualTo: "Tractors")
          .snapshots();
    } else if (selectedCategory.value == "Harvestors") {
      logger.d("insie else if Harvestors");
      return Firestore.instance
          .collection('rentTools')
          .where('toolType', isEqualTo: "Harvestors")
          .snapshots();
    } else if (selectedCategory.value == "Pesticides") {
      logger.d("insie else if Pesticides");
      return Firestore.instance
          .collection('rentTools')
          .where('toolType', isEqualTo: "Pesticides")
          .snapshots();
    }
  }
}

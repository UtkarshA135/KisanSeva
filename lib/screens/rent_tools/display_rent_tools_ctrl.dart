import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kisanseva/models/rent_tools_model.dart';

class DisplayRentToolsCtrl extends GetxController {
  RentToolsModel rentToolsModel = RentToolsModel();
  final isLoading = false.obs;
  Stream rentToolsStrems() {
    // return Firestore.instance.collection('rentTools').document().snapshot;
  }
}

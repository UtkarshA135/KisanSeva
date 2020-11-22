import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:kisanseva/models/rent_tools_model.dart';
import 'package:logger/logger.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:multi_image_picker/multi_image_picker.dart';

class AddRentToolsCtrl extends GetxController {
  RentToolsModel rentToolsModel = RentToolsModel();
  String picDownloadUrl = '';
  var logger = Logger(printer: PrettyPrinter());
  // Firestore firestore = FirebaseFirestore.instance;

  Future<dynamic> postImage(File imageFile) async {
    logger.d('inside postImage');
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child('rentTools/$fileName');
    // StorageUploadTask uploadTask = reference.putData(
    //     (await imageFile.getByteData(quality: 25)).buffer.asUint8List());
    StorageUploadTask uploadTask = storageReference.putFile(imageFile);
    print('here 2');
    StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    print(storageTaskSnapshot.ref.getDownloadURL());
    print('here 3');

    storageReference.getDownloadURL().then((fileURL) {
      // setState(() {
      rentToolsModel.toolImage = fileURL;
      // });
    });
    logger.d("toolImage url=${rentToolsModel.toolImage}");
    return storageTaskSnapshot.ref.getDownloadURL();
  }

  addRentTools(imageFile) async {
    await postImage(imageFile);
    logger.d("inside addRentTools ${rentToolsModel?.toJson()}");
    await Firestore.instance
        .collection("rentTools")
        .document()
        .setData(rentToolsModel.toJson());
    // await crudOp.createPost(
    //   collectionName: 'examsResources',
    //   data: _examModel.toJson(),
    // );
    // Get.back();
  }
}

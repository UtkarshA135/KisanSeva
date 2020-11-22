import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:kisanseva/models/crop_model.dart';
import 'package:kisanseva/screens/smartConnect/smartConnect.dart';
import 'package:logger/logger.dart';

class AddCropCtrl extends GetxController {
  CropModel cropModel = CropModel();
  String picDownloadUrl = '';
  var logger = Logger(printer: PrettyPrinter());
  // Firestore firestore = FirebaseFirestore.instance;

  Future<dynamic> postImage(File imageFile) async {
    logger.d('inside postImage');
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child('crop/$fileName');
    // StorageUploadTask uploadTask = reference.putData(
    //     (await imageFile.getByteData(quality: 25)).buffer.asUint8List());
    StorageUploadTask uploadTask = storageReference.putFile(imageFile);
    print('here 2');
    StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    logger.d(storageTaskSnapshot.ref.getDownloadURL());
    print('here 3');

    // storageTaskSnapshot.ref.getDownloadURL().then((fileURL) {
    //   // setState(() {
    //   cropModel.cropImage = fileURL;
    //   // });
    // });
    // logger.d("CropImage url=${cropModel.cropImage}");
    return storageTaskSnapshot.ref.getDownloadURL();
  }

  addCrop(imageFile) async {
    await postImage(imageFile).then((value) => cropModel.cropImage = value);
    logger.d("CropImage url=${cropModel.cropImage}");
    logger.d("inside addCrop ${cropModel?.toJson()}");
    await Firestore.instance
        .collection("crop")
        .document()
        .setData(cropModel.toJson());
    // await crudOp.createPost(
    //   collectionName: 'examsResources',
    //   data: _examModel.toJson(),
    // );
    
  }
}

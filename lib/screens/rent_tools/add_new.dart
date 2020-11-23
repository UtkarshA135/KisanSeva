import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'add_rent_tools_ctrl.dart';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  var imageFile;
  // List<Asset> multiImageList = List<Asset>();
  String dropdownValue = "Tractors";
  String newValue;
  final logger = Logger();
  final addRentToolsCtrl = Get.put(AddRentToolsCtrl());
  // Future<void> loadAssets() async {
  //   logger.d("loadAssets called");
  //   // print("======================================loadAssets called");

  //   List<Asset> imageList = List<Asset>();
  //   String error = 'No Error Dectected';

  //   try {
  //     imageList = await MultiImagePicker.pickImages(
  //       // materialOptions:  MaterialOptions(takePhotoIcon: "chat"),
  //       maxImages: 5,
  //       enableCamera: true,
  //       selectedAssets: imageList,
  //       cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
  //       materialOptions: MaterialOptions(
  //         actionBarColor: "#abcdef",
  //         actionBarTitle: "Example App",
  //         allViewTitle: "All Photos",
  //         useDetailsView: false,
  //         selectCircleStrokeColor: "#000000",
  //         // startInAllView: true,
  //         // useDetailsView :true,
  //       ),
  //     );
  //   } on NoImagesSelectedException catch (e) {
  //     // User pressed cancel, update ui or show alert
  //     logger.d('image not selected : error iis : $e');
  //   } on Exception catch (e) {
  //     error = e.toString();
  //   }
  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;

  //   setState(() {
  //     multiImageList = imageList;
  //     // _error = error;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    void _getImage(bool fromCamera) async {
      if (fromCamera) {
        imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
        setState(() {
          this.imageFile = imageFile;
          addRentToolsCtrl.rentToolsModel.toolImage = imageFile.toString();
        });
      } else {
        imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
        setState(() {
          this.imageFile = imageFile;
        });
      }
    }

    _addPhoto() {
      return Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
            ),
            height: 200,
            width: 200,
            child: imageFile == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text("Add Photo"),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.camera_alt,
                            ),
                            onPressed: () async {
                              _getImage(true);
                              // await loadAssets();
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.photo_library,
                            ),
                            onPressed: () {
                              _getImage(false);
                            },
                          ),
                        ],
                      ),
                    ],
                  )
                : Container(
                    child: Image.file(
                      imageFile,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () async {
                // Navigator.pop(context);
                // await addRentToolsCtrl.postImage(imageFile);
                await addRentToolsCtrl.addRentTools(imageFile);
                // if (addRentToolsCtrl.isLoading.value) {
                //   Get.dialog(Container(child: Text("Please wait...Uploading")));
                // }
                Navigator.pop(context);
              },
              shape: StadiumBorder(),
              child: Text(
                "Done",
                style: TextStyle(color: Colors.black87),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(5),
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 10,
          ),
          _addPhoto(),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            onChanged: (value) {
              addRentToolsCtrl.rentToolsModel.toolName = value;
            },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              border: OutlineInputBorder(),
              labelText: "Name",
              hintText: "Name",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            onChanged: (value) {
              addRentToolsCtrl.rentToolsModel.toolPricePerDay = value;
            },
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                border: OutlineInputBorder(),
                labelText: "Cost per Day",
                hintText: "eg : Rs xxx/day"),
          ),
          SizedBox(
            height: 10,
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              border: OutlineInputBorder(),
              labelText: "Category",
            ),
            value: dropdownValue,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
                addRentToolsCtrl.rentToolsModel.toolType = newValue;
              });
            },
            items: <String>['Tractors', 'Harvestors', 'Pesticides', 'Others']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            onChanged: (value) {
              addRentToolsCtrl.rentToolsModel.toolDescription = value;
            },
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                border: OutlineInputBorder(),
                labelText: "Description",
                hintText: "Description"),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kisanseva/screens/smartConnect/add_crop_ctrl.dart';

class AddCrop extends StatefulWidget {
  @override
  _AddCropState createState() => _AddCropState();
}

class _AddCropState extends State<AddCrop> {
  var imageFile;
  final addCropCtrl = Get.put(AddCropCtrl());
  @override
  Widget build(BuildContext context) {
    void _getImage(bool fromCamera) async {
      if (fromCamera) {
        imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
        setState(() {
          this.imageFile = imageFile;
          addCropCtrl.cropModel.cropImage = imageFile.toString();
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
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(25)),
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
                            onPressed: () {
                              _getImage(true);
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
                await addCropCtrl.addCrop(imageFile);
                Navigator.pop(context);
              },
              shape: StadiumBorder(),
              child: Text(
                "Upload",
                style: TextStyle(color: Colors.black87),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          // height: MediaQuery.of(context).size.height * 0.7,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10, left: 15, right: 15),
            child: ListView(
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
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8, top: 4, bottom: 4),
                  child: TextFormField(
                    onChanged: (value) {
                      addCropCtrl.cropModel.cropName = value;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      border: OutlineInputBorder(),
                      labelText: "Crop Name",
                      hintText: "Tomato,Onion etc",
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8, top: 4, bottom: 4),
                  child: TextFormField(
                    onChanged: (value) {
                      addCropCtrl.cropModel.msp = value;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        border: OutlineInputBorder(),
                        labelText: "Minimum Support Price",
                        hintText: "eg : Rs xxx/tonne"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8, top: 4, bottom: 4),
                  child: TextFormField(
                    onChanged: (value) {
                      addCropCtrl.cropModel.cropQuantity = value;
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        border: OutlineInputBorder(),
                        labelText: "Quantity",
                        hintText: "Can include the organic status and region"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8, top: 4, bottom: 4),
                  child: TextFormField(
                    onChanged: (value) {
                      addCropCtrl.cropModel.cropDescription = value;
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        border: OutlineInputBorder(),
                        labelText: "Crop Description",
                        hintText: "Can include the organic status and region"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

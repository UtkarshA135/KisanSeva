import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

import 'package:image_picker/image_picker.dart';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  var imageFile;
  @override
  Widget build(BuildContext context) {
    void _getImage(bool fromCamera) async {
      if (fromCamera) {
        imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
        setState(() {
          this.imageFile = imageFile;
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
              onPressed: () {
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
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                border: OutlineInputBorder(),
                labelText: "Cost per hour",
                hintText: "eg : Rs xxx/hr"),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
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

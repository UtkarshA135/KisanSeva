import 'package:flutter/material.dart';
import 'package:kisanseva/models/rent_tools_model.dart';
import 'package:kisanseva/screens/rent_tools/desc_page.dart';

class RentToolsTemplate extends StatelessWidget {
  final RentToolsModel rentToolsModel;

  const RentToolsTemplate({Key key, this.rentToolsModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DescPage(
              rentToolsModel: rentToolsModel,
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(1.0, 1.0),
                  blurRadius: 10.0,
                ),
              ]),
          child: Column(
            children: [
              Image(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                image: NetworkImage(rentToolsModel?.toolImage),
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                rentToolsModel?.toolName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${rentToolsModel?.toolPricePerDay}/day",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

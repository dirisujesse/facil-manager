import 'package:flutter/material.dart';
import 'package:shed_app/components/app_scaffold.dart';
import 'package:shed_app/models/property_model.dart';
import 'package:shed_app/styles/colors.dart';
import 'package:image_picker/image_picker.dart';

TextEditingController name;
ValueNotifier picture;
TextEditingController tenants;
TextEditingController apartments;

class FacilityCreatePage extends StatelessWidget {
  final bool isEditing;
  final PropertyModel facility;

  FacilityCreatePage({this.facility, this.isEditing = false}) {
    name = TextEditingController(text: isEditing ? facility.name : null);
    picture = ValueNotifier(isEditing ? facility.picture : null);
    tenants = TextEditingController(
        text: isEditing ? facility.tenants.length.toString() : null);
    apartments = TextEditingController(
        text: isEditing ? facility.apartments.toString() : null);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Form(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                child: GestureDetector(
                  child: ValueListenableBuilder(
                    valueListenable: picture,
                    builder: (context, pic, child) {
                      return Container(
                        constraints: BoxConstraints(maxHeight: 200),
                        child: pic == null
                            ? Center(
                                child: Icon(
                                  Icons.add_a_photo,
                                  size: 40,
                                  color: shedAppBodyBlack,
                                ),
                              )
                            : AspectRatio(
                                aspectRatio: 10 / 5,
                                child: pic is String
                                    ? Image.asset(
                                        pic,
                                        fit: BoxFit.fill,
                                      )
                                    : Image.file(
                                        pic,
                                        fit: BoxFit.fill,
                                      ),
                              ),
                      );
                    },
                  ),
                  onTap: () {
                    ImagePicker.pickImage(source: ImageSource.gallery)
                        .then((img) {
                      picture.value = img;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Facility Name"),
                controller: name,
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Facility Tenants"),
                controller: tenants,
                keyboardType: TextInputType.numberWithOptions(decimal: false),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Facility Apartments"),
                controller: apartments,
                keyboardType: TextInputType.numberWithOptions(decimal: false),
              ),
            ],
          ),
        ),
      ),
      pageTitle: ValueNotifier("FACILITY ${isEditing ? 'UPDATE' : 'CREATION'}"),
      bottomWidget: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 10.0,
        ),
        child: RaisedButton(
          onPressed: () => "",
          child: Text("${isEditing ? 'Update' : 'Create'} Facility"),
        ),
      ),
    );
  }
}

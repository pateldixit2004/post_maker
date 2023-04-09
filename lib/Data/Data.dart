import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:post_maker/Data/Modal_class.dart';

class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  String? path;
  TextEditingController txtna = TextEditingController();
  TextEditingController txtquli = TextEditingController();
  TextEditingController txttag = TextEditingController();
  TextEditingController taxno = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      dialog();
                    },
                    child:  Container(
                        height: 200,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade400,
                                width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        child: path == null
                            ? Icon(Icons.camera_alt,
                            size: 100, color: Colors.blue.shade200)
                            : ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(
                              File("$path"),
                              fit: BoxFit.cover,
                              height: 200,
                              width: 200,
                            )),
                    ),
                  ),
                  SizedBox(height: 10),

                  TextField(controller: txtna,
                    decoration: InputDecoration(border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink, width: 2)),hintText: 'Name'),

                  ),
                  SizedBox(height: 10),
                  TextField(controller: txtquli,
                    decoration: InputDecoration(border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink, width: 2)),
                    hintText: 'Qulifaication'),
                  ),
                  SizedBox(height: 10),
                  TextField(controller: txttag,
                    decoration: InputDecoration(border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink, width: 2)),
                    hintText: 'Tag Line'),
                  ),
                  SizedBox(height: 10),

                  TextField(controller: taxno,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink, width: 2)),
                    hintText: 'Phone No'),
                  ),

                  SizedBox(height: 10),
                  ElevatedButton(onPressed: () {

                    String name =txtna.text;
                    String qulification =txtquli.text;
                    String tagline =txttag.text;
                    DataModal d1 = DataModal(name: name,qulifaction: qulification,tagLine: tagline,image: path);


                    Navigator.pushNamed(context, 'quotes',arguments: d1);
                  }, child: Text("Sumit"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

void dialog()
{
  showDialog(context: context, builder: (context) {
    return AlertDialog(
      title: Text('Take a photo '),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(children: [
            InkWell(onTap: () async {
              ImagePicker image =ImagePicker();
              XFile? xfile = await image.pickImage(source: ImageSource.camera);
              setState(() {
                path =xfile!.path;


              });

            },
            child: Column(
              children: [
                Icon(Icons.camera,color: Colors.black,),
                SizedBox(height: 5),
                Text("Camera"),
              ],
            ),),
            SizedBox(width: 10,),
            InkWell(onTap: () async {
              ImagePicker image =ImagePicker();
              XFile? xfile = await image.pickImage(source: ImageSource.gallery);
              setState(() {
                path =xfile!.path;


              });

            },
              child: Column(
                children: [
                  Icon(Icons.browse_gallery,color: Colors.black,),
                  SizedBox(height: 5),
                  Text("Gallery"),
                ],
              ),)
          ],)
        ],
      ),

    );
  },);
}


}

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
// import 'package:path/path.dart'as path;
// import 'package:path_provide r/path_provider.dart' as syspaths;

// ignore: must_be_immutable
class ImageInput extends StatefulWidget {
  final Function onSelectImage;
  File storedImage;

  ImageInput(this.onSelectImage);
  @override
  _ImageInputState createState() => _ImageInputState();
}

File _image;
String _uploadUrl;

class _ImageInputState extends State<ImageInput> {
  // final picker = ImagePicker();
  bool isloading = false;

  Future<void> captureImage() async {
    final capture = ImagePicker();
    await capture
        .getImage(
          source: ImageSource.camera,
          maxHeight: 450,
          maxWidth: 450,
          imageQuality: 60,
        )
        .then((capturedImage) => setState(() {
              _image = File(capturedImage.path);
              print(_image);
            }));

    UploadingImage();
  }

  UploadingImage() async {
    setState(() {
      isloading = true;
    });
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child("images/${Path.basename(_image.path)}");
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print("File Uploaded");
    storageReference.getDownloadURL().then((value) => setState(() {
          _uploadUrl = value;
          print(_uploadUrl);
          isloading = false;
        }));
  }

  // Future<void> _takePicture() async {
  //   final image = await ImagePicker()
  //       .getImage(source: ImageSource.camera, maxHeight: 600, maxWidth: 600);
  //   //final imagepath = ath.basename(imahe);
  //   setState(() {
  //     storedImage = File(image.path);
  //   });

  // widget.onSelectImage(image);

  // if (storedImage == null) {
  //   return;
  // }

  // setState(() {
  //   _storedImage = File(imageFile.path);
  // });
  //final appDir = await syspaths.getApplicationDocumentsDirectory();
  //final fileName = path.basename(imageFile.path);
  //final savedImage = await _storedImage.copy('${appDir.path}/$fileName');
  //widget.onSelectImage(savedImage);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _image != null
              ? Image.file(
                  _image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  "No Image Chosen",
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: FlatButton.icon(
            icon: Icon(Icons.camera),
            label: Text('Take a Picture'),
            textColor: Theme.of(context).primaryColor,
            onPressed: captureImage,
          ),
        ),
      ],
    );
  }

  // Future uploadImageToFirebase(BuildContext context) async {
  //   String fileName = basename(storedImage.path);

  //   StorageReference firebaseStorageRef =
  //       FirebaseStorage.instance.ref().child('images/$fileName');
  //   StorageUploadTask uploadTask = firebaseStorageRef.putFile(storedImage);
  //   StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
  //   taskSnapshot.ref.getDownloadURL().then(
  //         (value) => print("Done: $value"),
  //       );
  // }

}

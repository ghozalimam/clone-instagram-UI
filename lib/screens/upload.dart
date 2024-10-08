import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? _image;
  final picker = ImagePicker();
  final TextEditingController _captionController = TextEditingController();

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
        actions: [
          if (_image != null)
            TextButton(
              onPressed: () {
                // TODO: Implement post upload logic
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Post uploaded successfully!')),
                );
                Navigator.pop(context);
              },
              child: Text('Share', style: TextStyle(color: Colors.blue)),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (_image == null)
              Container(
                height: 300,
                color: Colors.grey[200],
                child: Center(
                  child: Text('No image selected'),
                ),
              )
            else
              Image.file(_image!,
                  height: 300, width: double.infinity, fit: BoxFit.cover),
            SizedBox(height: 20),
            if (_image == null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => getImage(ImageSource.camera),
                    icon: Icon(Icons.camera_alt),
                    label: Text('Camera'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => getImage(ImageSource.gallery),
                    icon: Icon(Icons.photo_library),
                    label: Text('Gallery'),
                  ),
                ],
              )
            else
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _captionController,
                  decoration: InputDecoration(
                    hintText: 'Write a caption...',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ),
            // You can add more fields here like location, tag people, etc.
          ],
        ),
      ),
    );
  }
}

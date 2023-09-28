import 'package:flutter/material.dart';

class OpenImage extends StatefulWidget {
  String? image;
  OpenImage({Key? key, required this.image}) : super(key: key);

  @override
  State<OpenImage> createState() => _OpenImageState();
}

class _OpenImageState extends State<OpenImage> {
  String? dataImage;
  @override
  void initState() {
    dataImage = widget.image;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Open Image"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage(dataImage!))),
      ),
    );
  }
}

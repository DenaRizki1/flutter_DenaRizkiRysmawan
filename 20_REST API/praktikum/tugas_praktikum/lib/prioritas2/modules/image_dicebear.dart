import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:provider/provider.dart';
import 'package:tugas_praktikum/prioritas2/provider/image_provider.dart';

class imageDiceBear extends StatefulWidget {
  const imageDiceBear({super.key});

  @override
  State<imageDiceBear> createState() => _imageDiceBearState();
}

class _imageDiceBearState extends State<imageDiceBear> {
  TextEditingController nameEc = TextEditingController();

  String name = '';

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final imageProv = Provider.of<ImageProviders>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Generator'),
      ),
      body: Column(
        children: [
          Consumer<ImageProviders>(
            builder: (context, picprov, _) {
              return Image(
                image: picprov.image.isNotEmpty
                    ? Svg(picprov.image, source: SvgSource.network, size: Size(50, 50))
                    : const NetworkImage('https://i.pinimg.com/originals/ae/8a/c2/ae8ac2fa217d23aadcc913989fcc34a2.png') as ImageProvider,
                fit: BoxFit.cover,
                // height: 300,
                // width: 300,
              );
            },
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: nameEc,
                decoration: InputDecoration(
                  hintText: 'Input Your Name',
                  label: const Text('Your Name'),
                  filled: true,
                  fillColor: Colors.blueGrey.withOpacity(0.5),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                name = nameEc.text;
                imageProv.picture(name);
              }
            },
            child: Consumer<ImageProviders>(
              builder: (context, picProvider, circular) {
                return const Text('Register');
              },
              child: const CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}

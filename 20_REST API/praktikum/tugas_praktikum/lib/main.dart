import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_praktikum/prioritas2/modules/image_dicebear.dart';
import 'package:tugas_praktikum/prioritas2/provider/image_provider.dart';

void main() {
  //prioritas 1
  // runApp(MultiProvider(
  //   providers: [
  //     ChangeNotifierProvider(
  //       create: (context) => RegisterProvider(),
  //     )
  //   ],
  //   child: const MaterialApp(home: MyApp()),
  // ));

  //prioritas 2

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ImageProviders(),
        ),
      ],
      child: const MaterialApp(
        home: imageDiceBear(),
      ),
    ),
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppIos extends StatefulWidget {
  const AppIos({super.key});

  @override
  State<AppIos> createState() => _AppIosState();
}

class _AppIosState extends State<AppIos> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("CupertinoApp"),
        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: const Center(
          child: Text("This is CupertinoApp"),
        ),
      ),
    );
  }
}

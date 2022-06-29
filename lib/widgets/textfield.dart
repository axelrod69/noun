import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  //TextField({Key? key}) : super(key: key);
  final String label;
  final String text;
  final Function onChanged;

  TextFieldWidget(
      {required this.label, required this.onChanged, required this.text});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  //final String label;
  final String text;
  final int maxLines;
  final ValueChanged<String> onChanged;
  final String hintTextFor;

  const TextFieldWidget({
    Key? key,
    this.maxLines = 1,
    //required this.label,
    required this.text,
    required this.onChanged,
    this.hintTextFor = '',
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;
  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.text);

    //from gpt: to clear the field when the user taps on the field
    controller.addListener(() {
      if (controller.text == widget.text) {
        controller.clear();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style: TextStyle(
              fontFamily: 'Thonburi',
              fontSize: 12,
              color: const Color(0xffFFFFFF).withOpacity(0.8),
              //fontWeight: FontWeight.bold,
            ),
            controller: controller,
            maxLines: widget.maxLines,
            decoration: InputDecoration(
              helperText: widget.hintTextFor,
              helperStyle: const TextStyle(fontSize: 12.0),
              //floatingLabelBehavior: FloatingLabelBehavior.auto,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Color(0xffB4B4B4),
                    width: 1.0,
                    strokeAlign: BorderSide.strokeAlignInside),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(161, 163, 161,
                      1.0), // Set your desired highlight color here
                  width: 1.5, // Adjust the width of the highlight
                ),
              ),
              prefixIcon: null,
              suffixIcon: null,
              contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
            ),
            onChanged: widget.onChanged,
            cursorColor: const Color.fromRGBO(161, 163, 161, 1.0),
          ),
        ],
      );
}

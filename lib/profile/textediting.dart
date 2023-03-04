import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
   final int maxLines;

  const TextFieldWidget({
    required this.label,
    required this.maxLines,
  });

@override
_TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late TextEditingController controller;

@override 
void initState() {
  super.initState();

  controller = TextEditingController();
}
@override
void dispose() {
  controller.dispose();

  super.dispose();
}

  Widget build(BuildContext context) => Column (
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          widget.label + ': ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Color.fromARGB(255, 162, 96, 20)),
           ),
      ),
        Container(
          padding: const EdgeInsets.all(5),
              child: TextFormField (
                  controller:controller,
                  maxLines: widget.maxLines,
                  decoration: InputDecoration(border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                     borderSide: BorderSide(
                  color: Color.fromARGB(255, 162, 96, 20),
                  ),
                  ),
                  fillColor: Color.fromARGB(255, 235, 214, 191),
                  filled: true,
                  )
              ),
        ),
    ],
  );
}
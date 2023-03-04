import 'package:flutter/material.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _currentSliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Slider(
        value: _currentSliderValue,
        min:1,
        max: 10,
        divisions: 10,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
        },
        activeColor: const Color.fromARGB(255, 162, 96, 20),
            inactiveColor: Color.fromARGB(255, 162, 96, 20),
            thumbColor: Color.fromARGB(255, 162, 96, 20),
      ),
    );
  }
}
import 'package:flutter/material.dart';

/// A button that changes color left to right when pressed
class ColorChangingButton extends StatefulWidget {
  const ColorChangingButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  _ColorChangingButtonState createState() => _ColorChangingButtonState();
}

class _ColorChangingButtonState extends State<ColorChangingButton> {
  Color _buttonColor = Colors.greenAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key("${widget.title}"),
      appBar: AppBar(
        title: Text("${widget.title}"),
      ),
      body: SafeArea(
        child: Center(
            child: GestureDetector(
          onTap: () {
            setState(() {
              _buttonColor = Colors.blueAccent;
            });
          },
          child: AnimatedContainer(
            height: 200,
            width: 200,
            duration: Duration(milliseconds: 500),
            decoration: BoxDecoration(
              color: _buttonColor,
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        )),
      ),
    );
  }
}

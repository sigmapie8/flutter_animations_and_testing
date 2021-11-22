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

class _ColorChangingButtonState extends State<ColorChangingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..addListener(() {
            setState(() {});
          });

    _colorAnimation = ColorTween(begin: Colors.purple, end: Colors.green)
        .animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: Key("${widget.title}"),
      appBar: AppBar(
        title: Text("${widget.title}"),
      ),
      body: SafeArea(
        child: Center(
            child: OutlinedButton(
          onPressed: () {
            _animationController.forward();
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: _colorAnimation.value,
            padding: EdgeInsets.all(20),
            fixedSize: Size(size.width * 0.2, size.width * 0.1),
          ),
          child: Text(
            "Completed",
            style: TextStyle(color: Colors.white),
          ),
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TypingText extends StatefulWidget {
  const TypingText({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _TypingTextState createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<int> _stringIndex;
  String textToAnimate =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 150 * textToAnimate.length))
      ..addListener(() {
        setState(() {});
      });

    _stringIndex = IntTween(begin: 0, end: textToAnimate.length)
        .animate(_animationController);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key("${widget.title}"),
      appBar: AppBar(
        title: Text("${widget.title}"),
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('${textToAnimate.substring(0, _stringIndex.value)}'),
            Blinker(
              writingCompleted: _animationController.isCompleted,
            ),
          ],
        ),
      ),
    );
  }
}

class Blinker extends StatefulWidget {
  const Blinker({Key? key, required this.writingCompleted}) : super(key: key);

  final bool writingCompleted;

  @override
  _BlinkerState createState() => _BlinkerState();
}

class _BlinkerState extends State<Blinker> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _blinkerColor;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
          ..addListener(() {
            if (_animationController.isCompleted && !widget.writingCompleted) {
              _animationController.reset();
              _animationController.forward();
            } else if (widget.writingCompleted) {
              _animationController.dispose();
            }
            setState(() {});
          });
    _blinkerColor = ColorTween(begin: Colors.transparent, end: Colors.black)
        .animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 20,
      color: widget.writingCompleted ? Colors.transparent : _blinkerColor.value,
    );
  }
}

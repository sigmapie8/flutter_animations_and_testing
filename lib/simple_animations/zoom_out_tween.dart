import 'package:flutter/material.dart';

class ZoomOutTween extends StatefulWidget {
  const ZoomOutTween({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ZoomOutTweenState createState() => _ZoomOutTweenState();
}

class _ZoomOutTweenState extends State<ZoomOutTween>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _side;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _side =
        Tween<double>(begin: 100.0, end: 200.0).animate(_animationController);
    _opacity =
        Tween<double>(begin: 1.0, end: 0.0).animate(_animationController);

    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title}"),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            _animationController.forward();
          },
          child: Container(
            color: Color.fromRGBO(0, 128, 0, _opacity.value),
            height: _side.value,
            width: _side.value,
          ),
        ),
      ),
    );
  }
}

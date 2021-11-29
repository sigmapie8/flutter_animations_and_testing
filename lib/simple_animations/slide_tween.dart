import 'package:flutter/material.dart';

class SlideTween extends StatefulWidget {
  const SlideTween({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SlideTweenState createState() => _SlideTweenState();
}

class _SlideTweenState extends State<SlideTween> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _leftPosition;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animationController.addListener(() {
      setState(() {});
    });
  }

  void initializeAnimation(double screenWidth) {
    _leftPosition = Tween<double>(begin: 50, end: screenWidth - 50 - 100)
        //.chain(CurveTween(curve: Curves.bounceIn))
        .animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    initializeAnimation(screenWidth);
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title}"),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 100,
            left: _leftPosition.value,
            child: InkWell(
              onTap: () {
                setState(() {
                  _animationController.forward();
                  if (_animationController.isCompleted) {
                    _animationController.reset();
                  }
                });
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.amber,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

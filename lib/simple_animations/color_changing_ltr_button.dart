import 'package:flutter/material.dart';

class ColorChangingLTRButton extends StatefulWidget {
  const ColorChangingLTRButton({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  _ColorChangingLTRButtonState createState() => _ColorChangingLTRButtonState();
}

class _ColorChangingLTRButtonState extends State<ColorChangingLTRButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..addListener(() {
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
    Size size = MediaQuery.of(context).size;
    _widthAnimation = Tween<double>(begin: 0.0, end: size.width * 0.2)
        // .chain(CurveTween(curve: Curves.bounceOut))
        .animate(_animationController);

    return Scaffold(
      key: Key("${widget.title}"),
      appBar: AppBar(
        title: Text("${widget.title}"),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => _animationController.forward(),
          child: Center(
            child: Stack(
              children: <Widget>[
                Container(
                  height: size.width * 0.1,
                  width: size.width * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(5)),
                ),
                Container(
                  width: _widthAnimation.value,
                  height: size.width * 0.1,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5)),
                ),
                Container(
                  height: size.width * 0.1,
                  width: size.width * 0.2,
                  color: Colors.transparent,
                  child: Center(
                    child: Text(
                      "Completed",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

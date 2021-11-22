import 'package:flutter/material.dart';
import 'package:flutter_animations_and_testing/simple_animations/color_changing_button.dart';
import 'package:flutter_animations_and_testing/simple_animations/color_changing_diagonal_button.dart';
import 'package:flutter_animations_and_testing/simple_animations/color_changing_ltr_button.dart';
import 'package:flutter_animations_and_testing/simple_animations/typing_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          ColorChangingButton(title: "Color Changing Button"))),
              child: ListTile(
                title: Text("Color changing button"),
                subtitle:
                    Text("A button that changes color when it is pushed."),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ColorChangingLTRButton(
                          title: "Color Changing Left to Right Button"))),
              child: ListTile(
                title: Text("Color changing left to right button"),
                subtitle: Text(
                    "A button that changes color left to right when it is pushed."),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ColorChangingDiagonalButton(
                          title: "Color Changing Diagonal Button"))),
              child: ListTile(
                title: Text("Color changing diagonal button"),
                subtitle: Text(
                    "A button that changes color left top to right bottom when it is pushed."),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => TypingText(title: "Typing Text"))),
              child: ListTile(
                title: Text("Typing Text"),
                subtitle: Text("Text seems to be getting typed on load."),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

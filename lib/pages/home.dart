import 'package:control_pad/views/circle_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:control_pad/control_pad.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:simple_joystick_ble/widgets/popup_shaped.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  bool _menuShown = false;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Animation opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    if (_menuShown)
      animationController.forward();
    else
      animationController.reverse();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Simple Joystick BLE"),
        actions: <Widget> [
            Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                      Icons.bluetooth,
                      color: Colors.white
                  ),
                  onPressed: () {
                    setState(() {
                      _menuShown = !_menuShown;
                    });
                  }
              ),
              Positioned(
                child: FadeTransition(
                  opacity: opacityAnimation,
                  child: PopupShaped(onlyTop: true),
                ),
                right: 4.0,
                top: 48.0,
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              JoystickView(),
              PadButtonsView(),
            ],
          )
        ),
      ),
    );
  }
}


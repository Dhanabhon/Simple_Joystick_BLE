// Copyright 2020 THANAPHON.COM. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:simple_joystick_ble/pages/home.dart';
void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Joystick BLE',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 55, 127, 131),
        )
      ),
      home: HomePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'ui/welcome_home.dart';
import 'ui/container.dart';
import 'ui/stack.dart';
import 'ui/scaffold.dart';
import 'ui/bottom_navigation.dart';
import 'ui/gesture.dart';
import 'ui/async_api.dart';

void main() {
  runApp(new MaterialApp(
          title: 'Welcome App',
          home: new AsyncExample()
  )
  );
}

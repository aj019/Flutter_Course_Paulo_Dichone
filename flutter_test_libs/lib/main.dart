import 'package:flutter/material.dart';
import 'ui/welcome_home.dart';
import 'ui/container.dart';
import 'ui/stack.dart';
import 'ui/scaffold.dart';
import 'ui/bottom_navigation.dart';
import 'ui/gesture.dart';
import 'ui/async_api.dart';
import 'package:flutter_test_libs/ui/anim/animation_basic.dart';
import 'package:flutter_test_libs/ui/anim/ease_in.dart';
import 'package:flutter_test_libs/ui/anim/offset_delay.dart';
import 'package:flutter_test_libs/ui/anim/parenting.dart';
import 'package:flutter_test_libs/ui/anim/transformation.dart';
import 'package:flutter_test_libs/ui/anim/masking.dart';

void main() {
  runApp(new MaterialApp(
          title: 'Welcome App',
          home: new MaskingWidget()
  )
  );
}

import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  
  double get h => MediaQuery.of(this).size.height;
  double get w => MediaQuery.of(this).size.width;
  double get topPadding => MediaQuery.of(this).viewPadding.top;
  double get bottom => MediaQuery.of(this).viewInsets.bottom;
  double get appBarHeight => AppBar().preferredSize.height;
}

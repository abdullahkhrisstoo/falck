import 'package:falack_app/core/utils/constant/app_constant.dart';
import 'package:falack_app/core/utils/extensions/sized_extension.dart';
import 'package:flutter/material.dart';

class SharedGradientScaflod extends StatelessWidget {
  const SharedGradientScaflod(
      {super.key, required this.appBarTitle, required this.children});
  final String appBarTitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(appBarTitle),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true),
        extendBodyBehindAppBar: true,
        body: Container(
          
            height: context.h,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Theme.of(context).colorScheme.scrim,
                  Theme.of(context).colorScheme.primary
                ])),
            padding: AppConstant.APP_PADDING_ALIGNMENT,
            child: SingleChildScrollView(
              padding: AppConstant.APP_PADDING_ALIGNMENT,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  SizedBox(height: context.appBarHeight),
                  ...children
                ]))));
  }
}

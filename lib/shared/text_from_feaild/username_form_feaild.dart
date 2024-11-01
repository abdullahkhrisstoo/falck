import 'package:falack_app/shared/text_from_feaild/text_form_feild.dart';
import 'package:flutter/material.dart';

class UsernameFormFeaild extends TextF {
  const UsernameFormFeaild(TextEditingController controller, {super.key})
      : super(controller: controller);

  @override
  TextF build(BuildContext context) =>
      TextF(hintText: "Username", controller: controller);
}

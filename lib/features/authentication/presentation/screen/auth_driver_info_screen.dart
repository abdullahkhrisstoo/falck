import 'package:falack_app/shared/button/filled_button_factory.dart';
import 'package:falack_app/shared/button/outlined_button_factory.dart';
import 'package:flutter/material.dart';
import 'package:falack_app/core/utils/constant/app_constant.dart';
import 'package:falack_app/core/utils/extensions/sized_extension.dart';
import 'package:falack_app/features/authentication/presentation/components/bottom_naviagtion_widget.dart';
import 'package:falack_app/shared/text_from_feaild/phone_form_feild.dart';
import 'package:falack_app/shared/text_from_feaild/text_form_feild.dart';

class DriverInfoScreen extends StatefulWidget {
  const DriverInfoScreen({super.key});

  @override
  State<DriverInfoScreen> createState() => _DriverInfoScreenState();
}

class _DriverInfoScreenState extends State<DriverInfoScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: AppConstant.APP_PADDING_ALIGNMENT,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Confirm Your Account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Row(children: [
                    Expanded(
                        child: TextF(
                            hintText: "First Name",
                            controller: _firstNameController,
                            maxLength: 10)),
                    const SizedBox(width: 10),
                    Expanded(
                        child: TextF(
                            hintText: "Last Name",
                            controller: _lastNameController,
                            maxLength: 10))
                  ]),
                  const SizedBox(height: 10),
                  WidgetPhoneField(
                      onCountryChanged: (Country) {},
                      phoneController: _phoneController),
                  SizedBox(height: context.h * 0.6333),
                  BottomNavigationWidget(
                    onBackPressed: () {},
                    onNextPressed: _showConfirmationBottomSheet,
                  )
                ])));
  }

  void _showConfirmationBottomSheet() {

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the bottom sheet to adapt its height
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text('Is this you?',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ))),
              const Divider(),
              Text('Confirm Your Number',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    child: Text(_firstNameController.text[0]),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _firstNameController.text,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(_phoneController.text,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
             FilledButtonWidget(
                
                  title: "Yes, it's me",
                  onPressed: () {}),
              SizedBox(height: 15),
             OutlinedButtonWidget(
            
                  title: "No, this is not me",
                  onPressed: () {}),
            ],
          ),
        );
      },
    );
  }
}

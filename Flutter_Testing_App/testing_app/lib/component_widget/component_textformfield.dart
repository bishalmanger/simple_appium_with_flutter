import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ComponentTextformfield extends StatelessWidget {
  final Key? key;
  final String textHint;
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validatorn;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextInputType? textInputType;
  final Key? formFieldKey;

  ComponentTextformfield(
                         {
                           this.key,
                           required this.label,
                           required this.textHint,
                           required this.validatorn,
                           this.suffixIcon,
                           this.prefixIcon,
                           required this.controller,
                           this.textInputType,
                           this.formFieldKey
                         });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formFieldKey,
       controller: controller,
       validator: validatorn,
       keyboardType: textInputType,
       decoration: InputDecoration(
          label: Text(label,),
          hintText: textHint,
          suffixIcon: Icon(suffixIcon),
          prefixIcon: Icon(prefixIcon),
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
       ),
    );
  }
}

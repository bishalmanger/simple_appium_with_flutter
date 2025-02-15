import 'package:flutter/material.dart';

class ComponentButton extends StatelessWidget {
  final Key? key;
  final String label;
  final VoidCallback onPress;
  final IconData? suffixIcon;
  final Icon? prefixIcon;
  final Color? bgcolor;
  final double? borderRadius;
  final TextStyle? buttonTextStyle;
  final bool isLoading;
  final Key? KeyCompB;
  final Key? responseLog;

  ComponentButton(
                   {
                     this.key,
                     required this.label,
                     this.bgcolor = Colors.blueAccent,
                     required this.onPress,
                     this.suffixIcon,
                     this.prefixIcon,
                     this.borderRadius,
                     this.buttonTextStyle,
                     this.isLoading = false,
                     this.KeyCompB,
                     this.responseLog
                   });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60, width: double.infinity,
      child: ElevatedButton(
        key: KeyCompB,
             onPressed: onPress,
         style: ElevatedButton.styleFrom(backgroundColor: bgcolor?? Colors.blueAccent,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(8),  // Apply the custom border radius
           ),
         ),
        child: isLoading? CircularProgressIndicator(color: Colors.white,): Row(
          mainAxisAlignment: MainAxisAlignment.center,  // Ensure icons and text are centered
          children: [
            if (prefixIcon != null) ...[
              prefixIcon!,
              SizedBox(width: 8),  // Space between prefix icon and label
            ],
            Text(label, style: buttonTextStyle?? TextStyle(color: Colors.white, fontSize: 20)),
            if (suffixIcon != null) ...[
              SizedBox(width: 8),  // Space between label and suffix icon
              Icon(suffixIcon, color: Colors.white,),
            ],
          ],
        ),
      ),
    );
  }
}

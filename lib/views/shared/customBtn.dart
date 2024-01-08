import 'package:flutter/material.dart';
import 'package:quicknotes/views/shared/appstyle.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key, this.onTap, required this.label,
  });

  final void Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF9AD3D),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          height: 50,
          width: screenWidth > 600 ? MediaQuery.of(context).size.width * 0.5 : MediaQuery.of(context).size.width * 0.9,
          child: Center(
            child: Text(
              label,
              style: appstyle(20, Colors.white, FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

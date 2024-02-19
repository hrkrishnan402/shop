import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool isPrimary;
  final VoidCallback onPress;

  const CustomButton({
    Key? key,
    required this.title,
    required this.isPrimary,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        foregroundColor: isPrimary ? Colors.white : Colors.black,
        backgroundColor: isPrimary ? Colors.green : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Coffee_type extends StatelessWidget {
  final String coffee_type;
  final bool isSelected;
  final VoidCallback Ontap;

  Coffee_type(
      {required this.coffee_type,
      required this.isSelected,
      required this.Ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Ontap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          coffee_type,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.orange : Colors.white,
          ),
        ),
      ),
    );
  }
}

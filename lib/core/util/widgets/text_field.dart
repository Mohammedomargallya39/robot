import 'package:flutter/material.dart';
import 'package:robot/core/util/resources/extensions_manager.dart';
import '../resources/constants_manager.dart';

Widget textField({
  required controller,
  required String label
}) {
  return Column(
    children: [
      TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: label,
          hintStyle: TextStyle(
            fontFamily: 'english',
            fontSize: 14.rSp,
            color: Colors.grey
          ),
        ),
      ),
      verticalSpace(1.h),
    ],
  );
}

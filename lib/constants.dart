import 'package:flutter/material.dart';

const Color kDarkPurple = Color(0xFF2A2438);
const Color kPurple = Color(0xFF5C5470);
const Color kWhite = Color(0xFFFFFFFF);

InputDecoration kTextFieldDecoration = const InputDecoration(
  filled: true,
  fillColor: Color(0x77A2A0D1),
  hintText: 'hint text',
  prefixIcon: Icon(
    Icons.email,
  ),
  contentPadding: EdgeInsets.only(top: 15),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      width: 2.0,
      color: kDarkPurple,
    ),
  ),
);

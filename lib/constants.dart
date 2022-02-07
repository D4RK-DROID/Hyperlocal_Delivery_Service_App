import 'package:flutter/material.dart';

const Color kDarkPurple = Color(0xFF2A2438);
const Color kPurple = Color(0xFF5C5470);
const Color kMidPurple = Color(0xFF352f44);
const Color kLightPurple = Color(0xFFD8D8E3);
const Color kWhite = Color(0xFFFFFFFF);
const Color kYellow = Color(0xFFFFDF00);

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

InputDecoration kSearchFieldDecoration = InputDecoration(
  contentPadding: const EdgeInsets.all(0),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  filled: true,
  prefixIcon: const Icon(
    Icons.search,
    color: kDarkPurple,
  ),
  hintText: 'Search',
  hintStyle: const TextStyle(
    color: kDarkPurple,
    fontFamily: 'Oxygen',
  ),
  fillColor: const Color(0xFFFFFFFF),
);

const TextStyle kHeadingTextStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  fontFamily: 'Lora',
);

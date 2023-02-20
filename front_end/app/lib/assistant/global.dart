import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String google_api_key = "AIzaSyB_h5YHdaKKU9R0u4U0O3QKLy8kyjufLUs";

const String appName = "Meili Delivery";
const kPrimaryColor = Color(0xFF3D4784);
const klabelColor = Color(0xffB4B7BA);
const kPlaceholderColor = Color(0xff797979);
const kTitleColor = Color(0xff5B5F92);
const kBackgroundColor = Color(0xFFF3F8FE);
const kTypicalTextColor = Color(0xFF0C1D42);
const kGrey = Color(0xFFD3D3D3);
const kiconColor = Color(0xffAFAFAF);
const white = Color(0xffffffff);

final ktitle = GoogleFonts.balooBhaijaan2(
    textStyle: TextStyle(color: kTitleColor, letterSpacing: 0.5, fontSize: 25));
final kLabelStyle = GoogleFonts.balooBhaijaan2(
    textStyle: TextStyle(color: klabelColor, letterSpacing: 0.5, fontSize: 20));
final kPlaceholderStyle = GoogleFonts.akshar(
    textStyle:
        TextStyle(color: kPlaceholderColor, letterSpacing: 0.5, fontSize: 20));
// TextStyle(fontSize: 20, color: kPrimaryColor, fontWeight: FontWeight.bold
// fontFamily:  Baloo Bhaijaan);

// final khintStyle = TextStyle(
//   color: kPrimaryColor,
// );

const kOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(20.0)),
);
const kEnabledBorder = OutlineInputBorder(
  borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
  borderRadius: BorderRadius.all(Radius.circular(20.0)),
);
const kDisabledBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Color(0xfff9845f), width: 1.0),
  borderRadius: BorderRadius.all(Radius.circular(20.0)),
);
// ignore: prefer_const_constructors

final buttonStyle = BoxDecoration(
  color: kPrimaryColor,
  borderRadius: BorderRadius.circular(20),
);
const kTextFieldInputDecoration = InputDecoration(
  errorStyle: TextStyle(fontSize: 16.0, color: kPrimaryColor),
  // errorBorder: kErrorBorder,
  hintText: 'Fullname',
  // hintStyle: TextStyle(
  //   color: kPrimaryColor,
  // ),
  prefixIcon: Icon(Icons.phone, color: kPrimaryColor),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: kOutlineInputBorder,
  // enabledBorder: kEnabledBorder,
  // focusedBorder: kFocusedBorder,
  // disabledBorder: kDisabledBorder,
);

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String appName = "Meili Delivery";
const kPrimaryColor = Color(0xFF3D4784);
const klabelColor = Color(0xffB4B7BA);
const kPlaceholderColor = Color(0xff797979);
const kTitleColor = Color(0xff5B5F92);
const kBackgroundColor = Color(0xFFF3F8FE);
const kTypicalTextColor = Color(0xFF0C1D42);
const kGrey = Color(0xFFD3D3D3);
const KIconColor = Color(0xff6F6767);
const Color grey = Colors.grey;
const kiconColor = Color(0xffAFAFAF);
const white = Color(0xffffffff);
const Color mainFontColor = Color(0xff565c95);
final kBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.03),
        spreadRadius: 10,
        blurRadius: 3,
        // changes position of shadow
      ),
    ]);
final ktitle = GoogleFonts.balooBhaijaan2(
    textStyle: const TextStyle(
        color: kTitleColor,
        letterSpacing: 0.5,
        fontSize: 25,
        fontWeight: FontWeight.bold));
final kH1TextStyle = GoogleFonts.balooBhaijaan2(
    textStyle: const TextStyle(
        color: kPrimaryColor,
        letterSpacing: 0.5,
        fontSize: 20,
        fontWeight: FontWeight.bold));
final kH5TextStyle = GoogleFonts.balooBhaijaan2(
    textStyle: const TextStyle(
        color: kPrimaryColor,
        letterSpacing: 0.5,
        fontSize: 20,
        fontWeight: FontWeight.bold));
final kH3TextStyle = GoogleFonts.abel(
    textStyle: const TextStyle(
  color: Color(0xff6F6767),
  letterSpacing: 1,
  fontSize: 15,
));
final kLabelStyle = GoogleFonts.balooBhaijaan2(
    textStyle:
        const TextStyle(color: klabelColor, letterSpacing: 0.5, fontSize: 20));
final kPlaceholderStyle = GoogleFonts.akshar(
    textStyle: const TextStyle(
        color: kPlaceholderColor, letterSpacing: 0.5, fontSize: 14));

final kInkWellText = GoogleFonts.balooBhaijaan2(
    textStyle: const TextStyle(
        color: Color(0xff6F6767), fontSize: 15, fontWeight: FontWeight.bold));
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

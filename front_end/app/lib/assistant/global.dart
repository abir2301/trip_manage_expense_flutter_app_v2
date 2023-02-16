import 'package:flutter/material.dart';

const String google_api_key = "AIzaSyB_h5YHdaKKU9R0u4U0O3QKLy8kyjufLUs";

const String appName = "Meili Delivery";
const kPrimaryColor = Color(0xFF164e87);
const kSecondaryColor = Color(0xFF343e46);
const kBackgroundColor = Color(0xFFF3F8FB);
const kTypicalTextColor = Color(0xFF0C1D42);
const kGrey = Color(0xFFD3D3D3);

const kTitleStyle =
    TextStyle(fontSize: 25, color: kPrimaryColor, fontWeight: FontWeight.bold);

final khintStyle = TextStyle(
  color: kPrimaryColor,
);

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

const kFocusedBorder = OutlineInputBorder(
  borderSide: BorderSide(color: kSecondaryColor, width: 4.0),
  borderRadius: BorderRadius.all(Radius.circular(20.0)),
);

const kErrorBorder = OutlineInputBorder(
  borderSide: BorderSide(color: kSecondaryColor, width: 2.0),
  borderRadius: BorderRadius.all(Radius.circular(20.0)),
);

const kTextFieldInputDecoration = InputDecoration(
  errorStyle: TextStyle(fontSize: 16.0, color: kPrimaryColor),
  errorBorder: kErrorBorder,
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

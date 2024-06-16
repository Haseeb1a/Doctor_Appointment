import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

const appname = "eMart";
const appversion = "Version 1.0.0";
const credits = "@Baaba Devs";

class AppStrings {
  static String forgetpassword = "forget password?",
      signup = "SignUp",
      dontHaveAccount = "Dont have an Account? SingUp?",
      haveanAccount = "Alredy have an Account SingIn";
}

var iconsList = [
  "",
  "",
  "",
  "",
  "",
];

var iconsTitleList = [
  "All",
  "Primary Care",
  "Pediatrics",
  "Cardiology",
  "Dermatology",
  "OB/GYN",
  "Mental Health",
  "Orthopedics",
];
var categoryimage = [
  "assets/doctorss.jpg",
  "assets/primaryCare.webp",
  "assets/pediatrics.jpg",
  'assets/cadiolology.jpg',
  "assets/dermatology.jpg",
  "assets/ob.jpg",
  "assets/Mental Health.gif",
  "assets/Orthopedics.jpg"
];

var settingsitems = ["forget password", "tearm and conditions", "logout"];

var settingicons = [
  Icons.lock_open_outlined,
  Icons.bookmark_added,
  Icons.logout
];

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
  "Body",
  "ear",
  "liver",
  "lungs",
  "heart",
];
var categoryimage = [
  "assets/body.jpg",
  "assets/ears.jpg",
  'assets/liver.jpg',
  "assets/lunce.jpg",
  "assets/heart.jpg",
];

var settingsitems = ["forget password", "tearm and conditions", "logout"];

var settingicons = [Icons.lock_open_outlined, Icons.bookmark_added, Icons.logout];

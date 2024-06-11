import 'package:flutter/cupertino.dart';

class BottomController extends ChangeNotifier {
   int currentIndex = 0;

  void changeIndex(index) {
    currentIndex = index;
    notifyListeners();
  }
}

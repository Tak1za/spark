import 'package:flutter/material.dart';

class ListingType with ChangeNotifier {
  String _type = "Best";

  String get listingType {
    return _type;
  }

  void setListingType(String value) {
    _type = value;
    notifyListeners();
  }
}

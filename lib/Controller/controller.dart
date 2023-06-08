import 'dart:collection';

import 'package:bread_crust_provider/model/broadCrust.dart';
import 'package:flutter/material.dart';

class BroadCrustP extends ChangeNotifier {
  List<BroadCrust> _items = [];

  UnmodifiableListView<BroadCrust> get unmodifiedlist =>
      UnmodifiableListView(_items);

  void add(BroadCrust broadCrust) {
    for (final item in _items) {
      item.Activate();
    }
    _items.add(broadCrust);
    notifyListeners();
  }

  void reset() {
    _items.clear();
  }
}

import 'dart:collection';

import 'package:aina/src/presentation/dashboard/dashboard_provider/dashboard_model.dart';
import 'package:flutter/material.dart';

class DashboardData extends ChangeNotifier {
  final List<DrawerButtons> _drawerButtons = [
    DrawerButtons(name: 'Menu', icon: Icons.apps, isSelected: true),
    DrawerButtons(name: 'Recents', icon: Icons.settings_phone),
    DrawerButtons(name: 'Message', icon: Icons.chat),
    DrawerButtons(name: 'Settings', icon: Icons.settings),
  ];
  int _selectedIndex = 0;

  UnmodifiableListView<DrawerButtons> get drawers {
    return UnmodifiableListView(_drawerButtons);
  }

  int get selectedIndex => _selectedIndex;

  int get drawerCount {
    return _drawerButtons.length;
  }

  void setSelected(int index) {
    for (int i = 0; i < _drawerButtons.length; i++) {
      if (i == index) {
        _drawerButtons[i].isSelected = true;
        _selectedIndex = i;
      } else {
        _drawerButtons[i].isSelected = false;
      }
    }
    notifyListeners();
  }
}

import 'package:aina/src/constants/app_colors.dart';
import 'package:aina/src/constants/app_text_styles.dart';
import 'package:aina/src/presentation/dashboard/dashboard_pages/dashboard_drawer.dart';
import 'package:aina/src/presentation/dashboard/dashboard_provider/dashboard_data.dart';
import 'package:aina/src/presentation/menu/menu_pages/menu_page.dart';
import 'package:aina/src/presentation/recents/recents_pages/recents_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  // flex 3 6 13
  @override
  Widget build(BuildContext context) {
    var currentTab = [
      MenuPage(),
      RecentsPage(),
      MenuPage(),
      MenuPage(),
    ];
    return Scaffold(
      body: Row(
        children: [
          DashboardDrawer(),
          currentTab[Provider.of<DashboardData>(context).selectedIndex],
        ],
      ),
    );
  }
}

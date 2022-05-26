import 'package:aina/src/constants/app_colors.dart';
import 'package:aina/src/constants/app_text_styles.dart';
import 'package:aina/src/presentation/dashboard/dashboard_provider/dashboard_data.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var drawerProvider = Provider.of<DashboardData>(context);
    return Expanded(
      flex: 3,
      child: Container(
        decoration: BoxDecoration(color: AppColors.primary),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            ListView.builder(
              shrinkWrap: true,
              itemCount: drawerProvider.drawerCount,
              itemBuilder: (context, index) => Column(
                children: [
                  InkWell(
                    onTap: () => drawerProvider.setSelected(index),
                    child: buildSelectedButton(
                      drawerProvider.drawers[index].icon,
                      drawerProvider.drawers[index].name,
                      drawerProvider.drawers[index].isSelected ?? false,
                      context,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSelectedButton(
      IconData icon, String text, bool isSelected, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      decoration: isSelected
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(48), color: Colors.white)
          : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 32,
            color: isSelected ? AppColors.primary : Colors.grey,
          ),
          SizedBox(height: 6),
          Text(
            text,
            style: AppTextStyles.h2px16.copyWith(
              color: isSelected ? AppColors.primary : Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}

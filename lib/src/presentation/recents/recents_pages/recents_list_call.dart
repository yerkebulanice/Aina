import 'dart:collection';
import 'package:aina/src/constants/app_colors.dart';
import 'package:aina/src/constants/app_text_styles.dart';
import 'package:aina/src/models/client_model.dart';
import 'package:aina/src/provider/recent_clients_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentsListCall extends StatelessWidget {
  const RecentsListCall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ClientData>(context).client;

    return Expanded(
      flex: 6,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [AppColors.primary, Colors.white],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(48),
          ),
          padding: EdgeInsets.symmetric(horizontal: 36, vertical: 26),
          child: Column(
            children: [
              buildSwicherCall(),
              SizedBox(height: 40),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: (() =>
                        Provider.of<ClientData>(context, listen: false)
                            .setSelectClient(index)),
                    child: callCard(provider, index),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column callCard(UnmodifiableListView<Client> provider, int index) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:
                  (provider[index].isSelected ?? false) ? Colors.white : null),
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.phone_callback,
                    size: 24,
                    color: provider[index].callType == 'missed'
                        ? Colors.red
                        : Colors.grey.withOpacity(0.3),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(provider[index].clientName,
                          style: AppTextStyles.h2px16.copyWith(
                            color: AppColors.primary,
                          )),
                      SizedBox(height: 8),
                      Text(
                        provider[index].clientNumber,
                        style: AppTextStyles.h2px16.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                provider[index].lastCalledDate,
                style: AppTextStyles.h2px16.copyWith(
                    fontSize: 14, color: Colors.grey.withOpacity(0.3)),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }

  Row buildSwicherCall() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.grey.withOpacity(0.2)),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: AppColors.primary),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'All',
                    style: AppTextStyles.h2px16.copyWith(color: Colors.white),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Missed',
                    style: AppTextStyles.h2px16.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.grey.withOpacity(0.2)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              size: 20,
              color: Colors.grey.withOpacity(0.6),
            ),
          ),
        ),
      ],
    );
  }
}

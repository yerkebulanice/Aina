import 'package:aina/src/constants/app_colors.dart';
import 'package:aina/src/presentation/recents/recents_pages/recents_detail_call.dart';
import 'package:aina/src/presentation/recents/recents_pages/recents_list_call.dart';
import 'package:flutter/material.dart';

class RecentsPage extends StatelessWidget {
  const RecentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 19,
      child: Row(children: const [RecentsListCall(), RecentsDetailCall()]),
    );
  }
}

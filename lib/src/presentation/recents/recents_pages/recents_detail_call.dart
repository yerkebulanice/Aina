import 'package:aina/src/constants/app_colors.dart';
import 'package:aina/src/constants/app_text_styles.dart';
import 'package:aina/src/provider/page_manager.dart';
import 'package:aina/src/provider/recent_clients_provider.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentsDetailCall extends StatefulWidget {
  const RecentsDetailCall({Key? key}) : super(key: key);

  @override
  State<RecentsDetailCall> createState() => _RecentsDetailCallState();
}

class _RecentsDetailCallState extends State<RecentsDetailCall> {
  late final PageManager _pageManager;

  @override
  void initState() {
    _pageManager = PageManager();
    super.initState();
  }

  @override
  void dispose() {
    _pageManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ClientData>(context);
    return Expanded(
      flex: 13,
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(48),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recents',
                  style:
                      AppTextStyles.h1px24.copyWith(color: AppColors.primary),
                ),
                Row(
                  children: const [
                    Icon(Icons.arrow_back_ios, color: AppColors.primary),
                    SizedBox(width: 14),
                    Icon(Icons.arrow_forward_ios, color: AppColors.primary),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Welcome! ',
                      style: AppTextStyles.h2px16
                          .copyWith(color: Colors.grey.withOpacity(0.5)),
                    ),
                    Text(
                      'User',
                      style: AppTextStyles.h2px16,
                    ),
                    SizedBox(width: 10),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(38),
                        child:
                            Image.asset('assets/images/avatar.png', width: 24)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.secondary),
              padding: EdgeInsets.all(38),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(54),
                          child: Image.asset('assets/images/avatar.png',
                              width: 108)),
                      SizedBox(width: 32),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            provider.client[provider.selectedIndex].clientName,
                            style: AppTextStyles.h1px24
                                .copyWith(color: AppColors.primary),
                          ),
                          SizedBox(height: 14),
                          Text(
                            provider
                                .client[provider.selectedIndex].clientNumber,
                            style: AppTextStyles.h2px16
                                .copyWith(color: Colors.grey.withOpacity(0.7)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.green,
                    ),
                    padding: EdgeInsets.all(18),
                    child: Icon(Icons.phone, size: 32),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.start,
                      size: 32,
                      color: provider.client[provider.selectedIndex].callType ==
                              'missed'
                          ? Colors.red
                          : Colors.grey.withOpacity(0.7),
                    ),
                    SizedBox(width: 14),
                    Text(
                      provider.client[provider.selectedIndex].callType ==
                              'missed'
                          ? 'Missed Call'
                          : 'Income Call',
                      style: AppTextStyles.h2px16.copyWith(
                          color: provider.client[provider.selectedIndex]
                                      .callType ==
                                  'missed'
                              ? Colors.red
                              : Colors.grey.withOpacity(0.7)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: 32,
                      color: Colors.grey.withOpacity(0.7),
                    ),
                    SizedBox(width: 12),
                    Text(
                      provider.client[provider.selectedIndex].lastCalledDate,
                      style: AppTextStyles.h2px16
                          .copyWith(color: Colors.grey.withOpacity(0.7)),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 38),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Client Details',
                      style: AppTextStyles.h1px24
                          .copyWith(color: AppColors.primary),
                    ),
                    SizedBox(width: 14),
                    Text(
                      ':',
                      style: AppTextStyles.h1px24
                          .copyWith(color: Colors.grey.withOpacity(0.7)),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Text(
                  'Voice',
                  style: AppTextStyles.h2px16.copyWith(
                      color: Colors.grey.withOpacity(
                    0.7,
                  )),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    color: AppColors.secondary,
                  ),
                  child: ValueListenableBuilder<ProgressBarState>(
                    valueListenable: _pageManager.progressNotifier,
                    builder: (_, value, __) {
                      return ProgressBar(
                        progress: value.current,
                        buffered: value.buffered,
                        total: value.total,
                      );
                    },
                  ),
                ),
                ValueListenableBuilder<ButtonState>(
                  valueListenable: _pageManager.buttonNotifier,
                  builder: (_, value, __) {
                    switch (value) {
                      case ButtonState.loading:
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          width: 32.0,
                          height: 32.0,
                          child: const CircularProgressIndicator(),
                        );
                      case ButtonState.paused:
                        return IconButton(
                          icon: const Icon(Icons.play_arrow),
                          iconSize: 32.0,
                          onPressed: _pageManager.play,
                        );
                      case ButtonState.playing:
                        return IconButton(
                          icon: const Icon(Icons.pause),
                          iconSize: 32.0,
                          onPressed: _pageManager.pause,
                        );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

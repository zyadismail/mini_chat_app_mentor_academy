import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/styles.dart';
import 'package:mini_chat_app_mentor_academy/features/status/widgets/my_status_widget.dart';
import 'package:mini_chat_app_mentor_academy/features/status/widgets/recent_updates.dart';
import 'package:mini_chat_app_mentor_academy/features/status/widgets/viewed_updates.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusViewBody extends StatelessWidget {
  const StatusViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyStatusWidget(),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 30.w , vertical: 20.h),
          child: Text(
            'Recent updates',
            style: Styles.textStyle10.copyWith(color: Colors.grey),
          ),
        ),
        const RecentUpdates(),
        Padding(
          padding: const EdgeInsets.all(26.0),
          child: Text(
            'Viewed updates',
            style: Styles.textStyle10.copyWith(color: Colors.grey),
          ),
        ),
        const ViewedUpdates(),
      ],
    );
  }
}





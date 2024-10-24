import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/widgets/build_app_bar.dart';
import 'package:mini_chat_app_mentor_academy/features/status/widgets/status_view_body.dart';

class StatusView extends StatelessWidget {
  const StatusView({super.key});

 static const status = "status";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBar(),
      body: const StatusViewBody(),
    );
  }
}


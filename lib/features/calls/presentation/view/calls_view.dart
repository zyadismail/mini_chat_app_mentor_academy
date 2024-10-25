import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/widgets/build_app_bar.dart';
import 'package:mini_chat_app_mentor_academy/features/calls/presentation/view/widgets/calls_view_body.dart';

class CallsView extends StatelessWidget {
  const CallsView({super.key});
  static const calls = "calls";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const CallsViewBody(),
    );
  }
}



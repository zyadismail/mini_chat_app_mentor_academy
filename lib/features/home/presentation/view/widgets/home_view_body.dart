import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/app_color.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody>
    with WidgetsBindingObserver {
  int _currentIdx = 0;

  List<Widget> screens = [
    // ChatView(),
    // StatusView(),
    // CallsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIdx,
        onTap: (index) {
          setState(() {
            _currentIdx = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: AppColors.primaryColor,
            ),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.phone,
              color: AppColors.primaryColor,
            ),
            label: "Status",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: AppColors.primaryColor,
            ),
            label: "Calls",
          ),
        ],
      ),
      body: screens[_currentIdx],
    );
  }
}

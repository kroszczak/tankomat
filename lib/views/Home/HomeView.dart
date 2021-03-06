import 'package:flutter/material.dart';
import 'package:tankomat/components/BottomSheetWidget.dart';
import 'package:tankomat/components/FloatingActionButton.dart';
import 'package:tankomat/views/Dashboard/DashboardView.dart';
import 'package:tankomat/views/Calendar/CalendarView.dart';
import 'package:tankomat/views/Home/components/NavigationButton.dart';
import 'package:tankomat/views/Map/MapView.dart';
import 'package:tankomat/views/Profile/ProfileView.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeView> {
  int currentTab = 0;
  final List<Widget> tabs = [
    DashboardView(),
    MapView(),
    CalendarView(),
    ProfileView(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  void handleTabChange(int tabIndex) {
    setState(() {
      currentTab = tabIndex;
    });
  }

  PersistentBottomSheetController handleFabButtonPress(context) {
    return showBottomSheet(
      context: context,
      builder: (context) => BottomSheetWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: tabs[currentTab],
        bucket: bucket,
      ),
      floatingActionButton:
          AddInfoButton(handleFabButtonPress: handleFabButtonPress),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: <Widget>[
                  NavigationButton(
                    viewName: 'Panel',
                    currentTab: currentTab,
                    tabIndex: 0,
                    handleTabChange: handleTabChange,
                    iconName: Icons.dashboard,
                  ),
                  NavigationButton(
                    viewName: 'Mapa',
                    currentTab: currentTab,
                    tabIndex: 1,
                    handleTabChange: handleTabChange,
                    iconName: Icons.map,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  NavigationButton(
                    viewName: 'Kalendarz',
                    currentTab: currentTab,
                    tabIndex: 2,
                    handleTabChange: handleTabChange,
                    iconName: Icons.calendar_today,
                  ),
                  NavigationButton(
                    viewName: 'Profil',
                    currentTab: currentTab,
                    tabIndex: 3,
                    handleTabChange: handleTabChange,
                    iconName: Icons.person,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

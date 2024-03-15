import 'package:dentsu_test/common_widgets/user_photo.dart';
import 'package:dentsu_test/features/features_barrel.dart';
import 'package:dentsu_test/util/util_barrel.dart';
import 'package:flutter/material.dart';

class DashboardNavigationController extends StatefulWidget {
  const DashboardNavigationController({Key? key}) : super(key: key);

  @override
  DashboardNavigationControllerState createState() =>
      DashboardNavigationControllerState();
}

class DashboardNavigationControllerState extends State {
  int _selectedTab = 0;

  static const List _pages = [
    DashboardScreen(),
    LeadsScreen(),
    QuotesScreen(),
    ProfileScreen(),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    String imageUrl = "https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: Image.asset("assets/images/logo.png",
          height: 40.0, width: 40.0, color: theme.colorScheme.onPrimary,),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: UserPhoto(userProfilePhoto: imageUrl),
          ),
          IconButton(
            icon: Icon(Icons.search, color: theme.colorScheme.onPrimary, size: 30.0,),
            onPressed: () {
              // todo: Implement search
            },
          ),
          IconButton(
            icon: Icon(Icons.menu, color: theme.colorScheme.onPrimary, size: 30.0,),
            onPressed: () {
              // todo: Implement navigation drawer
            },
          ),
        ],
      ),
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        items: [
          BottomNavigationBarItem(icon: Image.asset("assets/images/home.png",
            height: 20.0, width: 20.0, color: _selectedTab == 0 ? theme.colorScheme.secondary : inactiveGreyColor,), label: "Dashboard"),
          BottomNavigationBarItem(icon: Image.asset("assets/images/leads.png",
            height: 20.0, width: 20.0, color: _selectedTab == 1 ? theme.colorScheme.secondary : inactiveGreyColor,), label: "Leads"),
          BottomNavigationBarItem(
              icon: Image.asset("assets/images/quotes.png",
                height: 20.0, width: 20.0, color: _selectedTab == 2 ? theme.colorScheme.secondary : inactiveGreyColor,), label: "Quotes"),
          BottomNavigationBarItem(
              icon: Image.asset("assets/images/profile.png",
                height: 20.0, width: 20.0, color: _selectedTab == 3 ? theme.colorScheme.secondary : inactiveGreyColor,), label: "Profile"),
        ],
      ),
    );
  }
}
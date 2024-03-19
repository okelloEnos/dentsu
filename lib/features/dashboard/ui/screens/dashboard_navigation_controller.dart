import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:dentsu_test/common_widgets/user_photo.dart';
import 'package:dentsu_test/features/features_barrel.dart';
import 'package:dentsu_test/util/util_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:go_router/go_router.dart';

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

    return WillPopScope(
      onWillPop: () async {
        var actionSelected = await showAnimatedDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                'Do you wish to exit the app?',
                style: TextStyle(
                    fontFamily: 'Dm Sans',
                    fontSize: 18.0,
                    color: theme.colorScheme.primary),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                            onTap: () => context.pop(true),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                              decoration: BoxDecoration(
                                  color: theme.colorScheme.error,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0))),
                              child: Center(
                                child: CustomTextWidget(
                                  text: "Yes",
                                  color: theme.colorScheme.onError,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,

                                ),
                              ),
                            )),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                            onTap: () => context.pop(false),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                              decoration: BoxDecoration(
                                  color: theme.colorScheme.secondary,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0))),
                              child: Center(
                                child: CustomTextWidget(
                                  text: "No",
                                  color: theme.colorScheme.onSecondary,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
          animationType: DialogTransitionType.slideFromTop,
          curve: Curves.fastOutSlowIn,
          duration: const Duration(seconds: 1),
        );

        return actionSelected ?? false;
      },
      child: Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: const CustomAppBar(),
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
      ),
    );
  }
}
import 'package:dentsu_test/common_widgets/user_photo.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String? imageUrl;
  final double height;
  const CustomAppBar({super.key, this.imageUrl, this.height = kToolbarHeight});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    String imageUrl = "https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

    return AppBar(
      title: Image.asset("assets/images/logo.png",
        height: 40.0, width: 40.0, color: theme.colorScheme.onPrimary,),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: UserPhoto(userProfilePhoto: imageUrl, isOnline: true),
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

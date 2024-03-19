import 'package:cached_network_image/cached_network_image.dart';
import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:dentsu_test/common_widgets/user_photo.dart';
import 'package:dentsu_test/features/features_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String? imageUrl;
  final double height;
  final bool? hideAvatar;
  final bool? hideSearch;
  final bool? hideMenu;
  final bool? hideBackButton;
  const CustomAppBar({super.key,
    this.imageUrl,
    this.height = kToolbarHeight,
    this.hideAvatar,
    this.hideSearch,
    this.hideMenu,
  this.hideBackButton
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    // String imageUrl = "https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

    return AppBar(
      automaticallyImplyLeading: (hideBackButton ?? false) ? true : false,
      title: Image.asset("assets/images/logo.png",
        height: 40.0, width: 40.0, color: theme.colorScheme.onPrimary,),
      actions: [
        (hideAvatar ?? false) ? const SizedBox.shrink() : Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if(state is ProfileSuccess){
                Profile profile = state.profile;
                return UserPhoto(userProfilePhoto: profile.profileImage, isOnline: true);
              }
              else if(state is ProfileLoading){
                return CircularSpinProgress(
                  spinColor: theme.colorScheme.onSecondary,
                  spinSize: 10.0,
                );
              }
              return Image.asset("assets/images/image_placeholder.png",
                height: 40.0, width: 40.0, color: theme.hintColor.withOpacity(0.4),);
            },
          )
          // child: UserPhoto(userProfilePhoto: imageUrl, isOnline: true),
        ),
        (hideSearch ?? false) ? const SizedBox.shrink() : IconButton(
          icon: Icon(Icons.search, color: theme.colorScheme.onPrimary, size: 30.0,),
          onPressed: () {
            // todo: Implement search
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: theme.colorScheme.secondary,
                content: CustomTextWidget(
                  text: "Coming soon",
                  color: theme.colorScheme.onSecondary,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
                duration: const Duration(seconds: 3),
              ),
            );
          },
        ),
        (hideMenu ?? false) ? const SizedBox.shrink() : IconButton(
          icon: Icon(Icons.menu, color: theme.colorScheme.onPrimary, size: 30.0,),
          onPressed: () {
            // todo: Implement navigation drawer
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: theme.colorScheme.secondary,
                  content: CustomTextWidget(
                    text: "Coming soon",
                    color: theme.colorScheme.onSecondary,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                  duration: const Duration(seconds: 3),
                ),);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

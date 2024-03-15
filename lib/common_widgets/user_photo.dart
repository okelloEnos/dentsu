import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'common_widget_barrel.dart';

class UserPhoto extends StatelessWidget {
  final String? userProfilePhoto;
  const UserPhoto({super.key, this.userProfilePhoto});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Stack(
      children: [
        userProfilePhoto != null ? CachedNetworkImage(
          imageUrl: userProfilePhoto ?? "",
          color: theme.colorScheme.primary,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.contain,
              ),
            ),
            height: 40.0,
            width: 40.0,
          ),
          placeholder: (context, url) => CircularSpinProgress(
            spinSize: 10.0,
          ),
          errorWidget: (context, url, error) => Container(
            decoration: BoxDecoration(
              border: Border.fromBorderSide(BorderSide(color: theme.colorScheme.onPrimary)),
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage('assets/images/profile.png'),
                fit: BoxFit.contain,
              ),
            ),
            height: 40.0,
            width: 40.0,
          ),
        ) :
        Container(
          decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(color: theme.colorScheme.onPrimary)),
            shape: BoxShape.circle,
            image: const DecorationImage(
              image: AssetImage('assets/images/profile.png'),
              fit: BoxFit.contain,
            ),
          ),
          height: 40.0,
          width: 40.0,
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: Container(
            height: 10.0,
            width: 10.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
          ),
        )
      ],
    );
  }
}

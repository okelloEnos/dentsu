import 'package:cached_network_image/cached_network_image.dart';
import 'package:dentsu_test/features/profile/ui/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import '../../../../common_widgets/common_widget_barrel.dart';


class ProfilePhoto extends StatelessWidget {
  final String imageUrl;
  const ProfilePhoto({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);

    return Stack(
      children: <Widget>[
        CustomHeader(height: screenHeight * 0.15),
        Positioned(
          bottom: 0.0,
          right: 20.0,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.colorScheme.onPrimary,
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.primary.withOpacity(0.4),
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 5.0),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipOval(
                child: CachedNetworkImage(
                  height: 100,
                  width: 100,
                  imageUrl: imageUrl,
                  imageBuilder: (context, imageProvider) =>
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  placeholder: (context, url) => CircularSpinProgress(
                    spinColor: theme.colorScheme.secondary,
                  ),
                  errorWidget: (context, url, error) =>
                  CircleAvatar(
                    backgroundColor: theme.colorScheme.onPrimary,
                    radius: 40,
                    child: Image.asset('assets/images/image_placeholder.png', color: theme.hintColor.withOpacity(0.4),),
                  ),
                ),
              ),
            ),
          ),)
      ],
    );
  }
}

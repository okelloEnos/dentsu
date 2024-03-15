import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'common_widget_barrel.dart';

class TopViewWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String assetName;
  final Color? assetColor;
  const TopViewWidget({super.key, required this.title,
    required this.subTitle, required this.assetName, this.assetColor});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return SizedBox(
      height: size.height * 0.3,
      child: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Image.asset(
              'assets/images/background.png',
              width: size.width,
              height: size.height * 0.3,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: size.height * 0.05,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/$assetName',
                    color: assetColor,
                    height: size.height * 0.1,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    title,
                    style: theme.textTheme.displayLarge,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(subTitle,
                      style: theme.textTheme.displayMedium),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class UpperViewWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? description;
  final String? assetName;
  final Color? assetColor;
  final Color? containerColor;
  final bool? showArrow;
  final bool? isTitleLarge;
  final String? remoteImage;
  const UpperViewWidget({super.key, this.title, this.description, this.showArrow,
    this.subTitle, this.assetName, this.assetColor, this.containerColor, this.isTitleLarge, this.remoteImage});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    bool showArrow = this.showArrow ?? false;

    return SizedBox(
      height: size.height * 0.3,
      child: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              width: size.width,
              height: size.height * 0.3,
             decoration: BoxDecoration(
               gradient: LinearGradient(
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 colors: [
                   theme.colorScheme.primary,
                   theme.colorScheme.primary.withOpacity(0.7),
                 ]
               )
             )
            ),
          ),
          Positioned(
            top: size.height * 0.08,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  remoteImage != null ? CachedNetworkImage(
                    imageUrl: remoteImage ?? "",
                    color: theme.colorScheme.primary,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        ),
                      ),
                      height: size.height * 0.1,
                      width: size.height * 0.1,
                    ),
                    placeholder: (context, url) => CircularSpinProgress(),
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/images/$assetName',
                      color: assetColor,
                      height: size.height * 0.1,
                      fit: BoxFit.contain,
                    ),
                  ) :
                  Image.asset(
                    'assets/images/$assetName',
                    color: assetColor,
                    height: size.height * 0.1,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    subTitle ?? "",
                    style: theme.textTheme.displayLarge,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(description ?? "",
                      style: theme.textTheme.displayMedium),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  showArrow ? const BackArrow() : const SizedBox.shrink(),
                  SizedBox(width: size.width * 0.25,),
                  Text(
                    title ?? "",
                    style: isTitleLarge ?? false ? theme.textTheme.displayLarge :
                    theme.textTheme.displayMedium?.copyWith(
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmptyViewWidget extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? containerHeight;
  final double? childTopHeight;
  const EmptyViewWidget({required this.containerHeight, required this.child, this.height, this.childTopHeight, super.key});


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return SizedBox(
      height: height ?? size.height * 0.3,
      child: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
                width: size.width,
                height: containerHeight ?? size.height * 0.3,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          theme.colorScheme.primary,
                          theme.colorScheme.primary.withOpacity(0.7),
                        ]
                    )
                )
            ),
          ),
          Positioned(
            top: childTopHeight ?? size.height * 0.08,
            left: 0.0,
            right: 0.0,
            child: child,
          ),
        ],
      ),
    );
  }
}

class TopWidget extends StatelessWidget {
  final String? assetName;
  final double? assetSize;
  final String? title;
  const TopWidget({super.key, this.assetName, this.assetSize, this.title});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(assetName ?? "assets/images/happy_avatar_logo.png",
        height: assetSize ?? 40, width: assetSize ?? 40,),
        const SizedBox(
          height: 20.0,
        ),
        Text(title ?? "", style: TextStyle(
          fontSize: 20.0,
          color: theme.colorScheme.primary,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.normal,
        ),),
        SizedBox(
            width: 100,
            child: Divider(
              thickness: 3.0,
              color: theme.colorScheme.secondary,
            )),
      ],
    );
  }
}

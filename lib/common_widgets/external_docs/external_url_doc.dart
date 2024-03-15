// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
//
// import 'package:webview_flutter/webview_flutter.dart';
//
// class ExternalDocument extends StatefulWidget {
//   final String url;
//   const ExternalDocument({Key? key, required this.url}) : super(key: key);
//
//   @override
//   ExternalDocumentState createState() {
//     return ExternalDocumentState();
//   }
// }
//
// class ExternalDocumentState extends State<ExternalDocument> {
//
//   // final Completer<WebViewController> _controller = Completer<WebViewController>();
//   bool isLoading = true;
//   late final WebViewController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // #docregion platform_features
//     late final PlatformWebViewControllerCreationParams params;
//
//     params = const PlatformWebViewControllerCreationParams();
//     final WebViewController controller =
//     WebViewController.fromPlatformCreationParams(params);
//     // #enddocregion platform_features
//
//     controller
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(Colors.white)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             debugPrint('WebView is loading (progress : $progress%)');
//             if(progress == 100){
//               // setState(() {
//               isLoading = false;
//               // });
//             }
//           },
//           onPageStarted: (String url) {
//             debugPrint('Page started loading: $url');
//           },
//           onPageFinished: (String url) {
//             debugPrint('Page finished loading: $url');
//             setState(() {
//               isLoading = false;
//             });
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse(widget.url));
//
//     _controller = controller;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//         child:  SafeArea(
//           child: Stack(
//             children: [
//               WebViewWidget(controller: _controller),
//               isLoading ? const Center(child: PageLoader()) : const SizedBox.shrink()
//             ],
//           ),
//         ));
//   }
// }
//
// class PageLoader extends StatelessWidget {
//   const PageLoader({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return SpinKitRipple(
//       color: theme.colorScheme.primary,
//       size: 100.0,
//     );
//   }
// }

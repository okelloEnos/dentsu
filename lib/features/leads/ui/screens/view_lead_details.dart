import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:dentsu_test/features/features_barrel.dart';
import 'package:dentsu_test/util/util_barrel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ViewLeadDetailsScreen extends StatelessWidget {
  const ViewLeadDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
        child: CustomScrollView(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            // SliverFillRemaining(
            //   hasScrollBody: true,
            //   fillOverscroll: true,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             GestureDetector(
            //               onTap: () => context.pop(),
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 mainAxisSize: MainAxisSize.min,
            //                 children: [
            //                   Icon(Icons.arrow_back,
            //                       color: theme.colorScheme.secondary, size: 20.0),
            //                   const SizedBox(width: 10.0),
            //                   CustomTextWidget(
            //                       text: "Back to all leads",
            //                       fontSize: 16.0,
            //                       fontWeight: FontWeight.w400,
            //                       color: theme.colorScheme.secondary),
            //                 ],
            //               ),
            //             ),
            //             CustomTextWidget(
            //                 text: "/",
            //                 fontSize: 16.0,
            //                 fontWeight: FontWeight.w400,
            //                 color: theme.colorScheme.tertiary),
            //             CustomTextWidget(
            //                 text: "LD-20210121-41760202",
            //                 fontSize: 16.0,
            //                 fontWeight: FontWeight.w400,
            //                 color: theme.colorScheme.tertiary),
            //           ],
            //         ),
            //         const SizedBox(height: 40.0),
            //         Card(
            //           child: Padding(
            //             padding: const EdgeInsets.only(
            //                 left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 CustomTextWidget(
            //                   text: "Lead Status",
            //                   fontSize: 18.0,
            //                   fontWeight: FontWeight.w500,
            //                   color: theme.colorScheme.tertiary,
            //                 ),
            //                 Container(
            //                   padding: const EdgeInsets.only(
            //                       top: 4.0, bottom: 4.0, left: 10.0, right: 20.0),
            //                   decoration: BoxDecoration(
            //                     gradient: LinearGradient(
            //                       colors: [
            //                         alternativeGradientColor,
            //                         theme.colorScheme.secondary,
            //                       ],
            //                     ),
            //                     borderRadius: BorderRadius.circular(90.0),
            //                   ),
            //                   child: Row(
            //                     mainAxisAlignment: MainAxisAlignment.start,
            //                     children: [
            //                       Container(
            //                           decoration: BoxDecoration(
            //                             color: theme.colorScheme.secondary,
            //                             shape: BoxShape.circle,
            //                           ),
            //                           child: Center(
            //                               child: Icon(Icons.check,
            //                                   color: theme.colorScheme.onSecondary,
            //                                   size: 18.0))),
            //                       const SizedBox(width: 10.0),
            //                       CustomTextWidget(
            //                         text: "Contacted",
            //                         fontSize: 16.0,
            //                         fontWeight: FontWeight.w400,
            //                         color: theme.colorScheme.onSecondary,
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         const SizedBox(height: 20.0),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Expanded(
            //               child: OutlinedButton.icon(
            //                   onPressed: () {},
            //                   icon: Icon(CupertinoIcons.multiply,
            //                       color: theme.colorScheme.secondary),
            //                   label: CustomTextWidget(
            //                     text: "Cancel lead",
            //                     fontSize: 16.0,
            //                     fontWeight: FontWeight.w400,
            //                     color: theme.colorScheme.secondary,
            //                   )),
            //             ),
            //             const SizedBox(width: 20.0),
            //             Expanded(
            //               child: CustomElevatedButton(
            //                 btnText: "Next        >",
            //                 onPressed: () {},
            //                 btnColor: theme.colorScheme.secondary,
            //                 radius: 90.0,
            //               ),
            //             ),
            //           ],
            //         ),
            //         const SizedBox(height: 20.0),
            //         const LeadDetailCard(),
            //         const SizedBox(height: 10.0),
            //         const Expanded(child: LeadMoreDetailCard())
            //       ],
            //     ),
            //   ),
            // ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_back,
                            color: theme.colorScheme.secondary, size: 20.0),
                        const SizedBox(width: 10.0),
                        CustomTextWidget(
                            text: "Back to all leads",
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: theme.colorScheme.secondary),
                      ],
                    ),
                  ),
                  CustomTextWidget(
                      text: "/",
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: theme.colorScheme.tertiary),
                  CustomTextWidget(
                      text: "LD-20210121-41760202",
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: theme.colorScheme.tertiary),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 40.0)),
            SliverToBoxAdapter(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                        text: "Lead Status",
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: theme.colorScheme.tertiary,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 4.0, bottom: 4.0, left: 10.0, right: 20.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              alternativeGradientColor,
                              theme.colorScheme.secondary,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.secondary,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                    child: Icon(Icons.check,
                                        color: theme.colorScheme.onSecondary,
                                        size: 18.0))),
                            const SizedBox(width: 10.0),
                            CustomTextWidget(
                              text: "Contacted",
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: theme.colorScheme.onSecondary,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.multiply,
                            color: theme.colorScheme.secondary),
                        label: CustomTextWidget(
                          text: "Cancel lead",
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: theme.colorScheme.secondary,
                        )),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: CustomElevatedButton(
                      btnText: "Next        >",
                      onPressed: () {},
                      btnColor: theme.colorScheme.secondary,
                      radius: 90.0,
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
            const SliverToBoxAdapter(child: LeadDetailCard()),
            const SliverToBoxAdapter(child: SizedBox(height: 10.0)),
            const SliverFillRemaining(child: LeadMoreDetailCard())
          ],
        ),
      )
      // body: Padding(
      //   padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           GestureDetector(
      //             onTap: () => context.pop(),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               mainAxisSize: MainAxisSize.min,
      //               children: [
      //                 Icon(Icons.arrow_back,
      //                     color: theme.colorScheme.secondary, size: 20.0),
      //                 const SizedBox(width: 10.0),
      //                 CustomTextWidget(
      //                     text: "Back to all leads",
      //                     fontSize: 16.0,
      //                     fontWeight: FontWeight.w400,
      //                     color: theme.colorScheme.secondary),
      //               ],
      //             ),
      //           ),
      //           CustomTextWidget(
      //               text: "/",
      //               fontSize: 16.0,
      //               fontWeight: FontWeight.w400,
      //               color: theme.colorScheme.tertiary),
      //           CustomTextWidget(
      //               text: "LD-20210121-41760202",
      //               fontSize: 16.0,
      //               fontWeight: FontWeight.w400,
      //               color: theme.colorScheme.tertiary),
      //         ],
      //       ),
      //       const SizedBox(height: 40.0),
      //       Card(
      //         child: Padding(
      //           padding: const EdgeInsets.only(
      //               left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               CustomTextWidget(
      //                 text: "Lead Status",
      //                 fontSize: 18.0,
      //                 fontWeight: FontWeight.w500,
      //                 color: theme.colorScheme.tertiary,
      //               ),
      //               Container(
      //                 padding: const EdgeInsets.only(
      //                     top: 4.0, bottom: 4.0, left: 10.0, right: 20.0),
      //                 decoration: BoxDecoration(
      //                   gradient: LinearGradient(
      //                     colors: [
      //                       alternativeGradientColor,
      //                       theme.colorScheme.secondary,
      //                     ],
      //                   ),
      //                   borderRadius: BorderRadius.circular(90.0),
      //                 ),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.start,
      //                   children: [
      //                     Container(
      //                         decoration: BoxDecoration(
      //                           color: theme.colorScheme.secondary,
      //                           shape: BoxShape.circle,
      //                         ),
      //                         child: Center(
      //                             child: Icon(Icons.check,
      //                                 color: theme.colorScheme.onSecondary,
      //                                 size: 18.0))),
      //                     const SizedBox(width: 10.0),
      //                     CustomTextWidget(
      //                       text: "Contacted",
      //                       fontSize: 16.0,
      //                       fontWeight: FontWeight.w400,
      //                       color: theme.colorScheme.onSecondary,
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //       const SizedBox(height: 20.0),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Expanded(
      //             child: OutlinedButton.icon(
      //                 onPressed: () {},
      //                 icon: Icon(CupertinoIcons.multiply,
      //                     color: theme.colorScheme.secondary),
      //                 label: CustomTextWidget(
      //                   text: "Cancel lead",
      //                   fontSize: 16.0,
      //                   fontWeight: FontWeight.w400,
      //                   color: theme.colorScheme.secondary,
      //                 )),
      //           ),
      //           const SizedBox(width: 20.0),
      //           Expanded(
      //             child: CustomElevatedButton(
      //               btnText: "Next        >",
      //               onPressed: () {},
      //               btnColor: theme.colorScheme.secondary,
      //               radius: 90.0,
      //             ),
      //           ),
      //         ],
      //       ),
      //       const SizedBox(height: 20.0),
      //       const LeadDetailCard(),
      //       const SizedBox(height: 10.0),
      //       const Expanded(child: LeadMoreDetailCard())
      //     ],
      //   ),
      // ),
    );
  }
}

import 'package:dentsu_test/features/features_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common_widgets/common_widget_barrel.dart';
import '../../../../util/constants/constants_barrel.dart';

class TotalLeadsStatCard extends StatelessWidget {
  const TotalLeadsStatCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 8.0, bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(text: "Total Leads",
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.tertiary,
                ),
                Icon(Icons.more_horiz, color: theme.hintColor.withOpacity(0.5))
              ],
            ),
            const SizedBox(height: 30.0),
            Center(child: BlocBuilder<LeadsBloc, LeadsState>(
  builder: (context, state) {
    if(state is LeadsLoaded) {
      final List<Lead> leads = state.leads;
      double totalLeads = leads.length.toDouble();
      double contactedLeads = leads.where((lead) =>
      (lead.leadContactedDate != null && lead.leadContactedDate != "null" && lead.leadContactedDate!.isNotEmpty)
      ).length.toDouble();
      return TotalLeadProgressBar(totalLeads: totalLeads, contactedLeads: contactedLeads);
    }
    else if(state is LeadsLoading) {
      return CircularSpinProgress(
        spinColor: theme.colorScheme.secondary,
      );
    }
    else if(state is LeadsFailure) {
      return Center(
        child: CustomTextWidget(
          text: "Error loading leads",
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: theme.hintColor,
        ),
      );
    }
    return const SizedBox.shrink();
  },
)),
            const Spacer(),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                  RichText(text: TextSpan(text: "Contacted ", style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: theme.colorScheme.tertiary,
                    fontFamily: "DM Sans",
                  ), children: [
                    WidgetSpan(child: BlocBuilder<LeadsBloc, LeadsState>(
                      builder: (context, state) {
                        if(state is LeadsLoaded) {
                          final List<Lead> leads = state.leads;
                          int contactedLeads = leads.where((lead) =>
                          (lead.leadContactedDate != null && lead.leadContactedDate != "null" && lead.leadContactedDate!.isNotEmpty)
                          ).length;
                          return CustomTextWidget(
                            text: "$contactedLeads",
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700,
                            color: theme.colorScheme.tertiary,
                          );
                        }
                        else if(state is LeadsLoading) {
                          return CustomTextWidget(
                            text: "...",
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: theme.hintColor,
                          );
                        }
                        else if(state is LeadsFailure) {
                          return CustomTextWidget(
                            text: "",
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: theme.hintColor,
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ))
                  ]))
                  ],
                ),
                // Sized
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: indicatorBackgroundColor,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    RichText(text: TextSpan(text: "Total Leads ", style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: theme.colorScheme.tertiary,
                      fontFamily: "DM Sans",
                    ), children: [
                      WidgetSpan(child: BlocBuilder<LeadsBloc, LeadsState>(
                        builder: (context, state) {
                          if(state is LeadsLoaded) {
                            final List<Lead> leads = state.leads;
                            int totalLeads = leads.length;
                            return CustomTextWidget(
                              text: "$totalLeads",
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              color: theme.colorScheme.tertiary,
                            );
                          }
                          else if(state is LeadsLoading) {
                            return CustomTextWidget(
                              text: "...",
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: theme.hintColor,
                            );
                          }
                          else if(state is LeadsFailure) {
                            return CustomTextWidget(
                              text: "",
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: theme.hintColor,
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ))
                    ]))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

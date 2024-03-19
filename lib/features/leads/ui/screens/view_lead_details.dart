import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:dentsu_test/features/features_barrel.dart';
import 'package:dentsu_test/util/util_barrel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ViewLeadDetailsScreen extends StatelessWidget {
  final Lead lead;
  final int leadIndex;

  const ViewLeadDetailsScreen(
      {super.key, required this.lead, required this.leadIndex});

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
                        text: "LD-${lead.id}",
                        fontSize: 14.0,
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
                        (lead.leadContactedDate != null
                            && lead.leadContactedDate != "null" &&
                            (lead.leadContactedDate?.isNotEmpty ?? false)) ?
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
                        ) : Container(
                          padding: const EdgeInsets.only(
                              top: 4.0, bottom: 4.0, left: 10.0, right: 20.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                theme.colorScheme.error,
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
                                    color: theme.colorScheme.onError,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                      child: Icon(Icons.cancel_outlined,
                                          color: theme.colorScheme.error,
                                          size: 18.0))),
                              const SizedBox(width: 10.0),
                              CustomTextWidget(
                                text: "Not Contacted",
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
                          onPressed: () {
                            context.pop();
                          },
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
                      child: BlocBuilder<LeadsBloc, LeadsState>(
                        builder: (context, state) {
                          return CustomElevatedButton(
                            btnText: "Next        >",
                            onPressed: () {
                              if(state is LeadsLoaded){
                                final List<Lead> leads = state.leads;
                                if(leadIndex + 1 < leads.length) {
                                  context.go('/dashboard/view_lead', extra: {
                                    "lead": leads[leadIndex + 1],
                                    "index": leadIndex + 1
                                  });
                                }
                                else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: theme.colorScheme.secondary,
                                      content: CustomTextWidget(
                                        text: "No more leads to view",
                                        color: theme.colorScheme.onSecondary,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      duration: const Duration(seconds: 3),
                                    ),
                                  );
                                }
                              }
                            },
                            btnColor: theme.colorScheme.secondary,
                            radius: 90.0,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
              SliverToBoxAdapter(child: LeadDetailCard(
                lead: lead,
              )),
              const SliverToBoxAdapter(child: SizedBox(height: 10.0)),
              SliverFillRemaining(child: LeadMoreDetailCard(
                lead: lead,
              ))
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/dashboard/edit_lead', extra: lead);
        },
        backgroundColor: theme.colorScheme.secondary,
        child: Icon(Icons.edit, color: theme.colorScheme.onSecondary,),
      )
    );
  }
}

import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:dentsu_test/features/dashboard/dashboard_barrel.dart';
import 'package:dentsu_test/features/features_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../util/functions/function_barrel.dart';

class EditLeadScreen extends StatefulWidget {
  final Lead lead;
  const EditLeadScreen({super.key, required this.lead});

  @override
  State<EditLeadScreen> createState() => _EditLeadScreenState();
}

class _EditLeadScreenState extends State<EditLeadScreen> {
  final TextEditingController reasonController = TextEditingController();
  DateTime todaysDate = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime currentDate = DateTime.now();


  DateTime? contactedDate;
  DateTime? nextAppointmentDate;
  TextEditingController contactedDateController = TextEditingController();
  TextEditingController nextAppointmentDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    contactedDateController.text = contactedDate != null ? DateTimeUtils.getDayMonthYear(contactedDate!) : "";
    nextAppointmentDateController.text = nextAppointmentDate != null ? DateTimeUtils.getDayMonthYear(nextAppointmentDate!) : "";
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: const CustomAppBar(
        hideSearch: true,
        hideMenu: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10.0,
              ),
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
              const SizedBox(
                height: 20.0,
              ),
              CustomTextWidget(text: "Update Lead",
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
                color: theme.colorScheme.tertiary.withOpacity(0.8),
              ),
              const SizedBox(height: 10.0),
              CustomTextWidget(text: "Lead contact date",
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.secondary,
              ),
              const SizedBox(height: 2.0),
              CustomTextField(
                controller: contactedDateController,
                hintText: "Enter lead contact date",
                textColor: theme.colorScheme.secondary,
                keyboardType: TextInputType.text,
                filledColor: theme.colorScheme.secondary.withOpacity(0.1),
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime(DateTime.now().year - 1),
                      firstDate: DateTime(DateTime.now().year - 1),
                      lastDate: DateTime.now());

                  setState(() {
                    contactedDate = picked;
                  });
                },
              ),
              const SizedBox(height: 10.0),
              CustomTextWidget(text: "Next appointment date",
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.secondary,
              ),
              const SizedBox(height: 2.0),
              CustomTextField(
                controller: nextAppointmentDateController,
                hintText: "Enter lead next appointment date",
                textColor: theme.colorScheme.secondary,
                keyboardType: TextInputType.text,
                filledColor: theme.colorScheme.secondary.withOpacity(0.1),
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(DateTime.now().year + 4));

                  setState(() {
                    nextAppointmentDate = picked;
                  });
                },
              ),
              const SizedBox(height: 10.0),
              CustomTextWidget(text: "Lead Close Reason",
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.secondary,
              ),
              const SizedBox(height: 2.0),
              CustomTextField(
                controller: reasonController,
                hintText: "Enter reason for closing lead",
                minLines: 2,
                maxLines: 4,
                textColor: theme.colorScheme.secondary,
                keyboardType: TextInputType.text,
                filledColor: theme.colorScheme.secondary.withOpacity(0.1),
              ),
              const SizedBox(height: 50.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: BlocConsumer<LeadsBloc, LeadsState>(
                  listener: (innerContext, state) {
                    if (state is UpdateLeadLoaded) {
                      showSuccessDialog(
                          context: context,
                          buttonPressed: (){
                            context.read<LeadsBloc>().add(FetchAllLeadsEvent());
                            context.go('/dashboard');
                          },
                          buttonText: "Done",
                          title: "Lead Updated",
                          description: "Details have been submitted and the lead details have been updated."
                      );
                    }
                    else if(state is UpdateLeadFailure) {
                      showErrorDialog(
                          context: context,
                          buttonPressed: (){
                            context.pop();
                          },
                          title: "Failed",
                          description: "An error occurred while updating the lead. Please try again.\n Reason: ${state.errorMessage}"
                      );
                    }
                  },
                  builder: (innerContext, state) {
                    return state is UpdateLeadLoading ?
                    SubmissionProgress(
                        submissionText: "Updating lead in progress...",
                      textColor: theme.colorScheme.secondary,
                    ) : CustomElevatedButton(btnText: "Update",
                        btnColor: theme.colorScheme.secondary,
                        textColor: theme.colorScheme.onSecondary,
                        fontWeight: FontWeight.w700,
                        textFontSize: 16.0,
                        radius: 90.0,
                        onPressed: () {

                          Lead updatedLeadData = widget.lead.copyWith(
                              leadContactedDate: contactedDate.toString(),
                              nextAppointmentDate: nextAppointmentDate.toString(),
                              leadCloseReason: reasonController.text
                          );
                          context.read<LeadsBloc>().add(UpdateLeadEvent(lead: updatedLeadData));
                        });
                  },
                )   ,
                 ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}

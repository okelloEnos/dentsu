import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:dentsu_test/features/dashboard/dashboard_barrel.dart';
import 'package:dentsu_test/features/features_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddNewLeadScreen extends StatefulWidget {
  const AddNewLeadScreen({super.key});

  @override
  State<AddNewLeadScreen> createState() => _AddNewLeadScreenState();
}

class _AddNewLeadScreenState extends State<AddNewLeadScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  List<String> allLeadSources = ["Choose your lead source","Bulk Upload", "Phone Calls", "Social Media", "Walk-in"];
  String selectedLeadSource = "Choose your lead source";
  String hintLeadSource = "Choose where you got the lead from";

  List<String> allProducts = ["Choose product requested","Mortgage", "One Xtra Account", "Motor Insurance", "Credit Cards"];
  String selectedProduct = "Choose product requested";
  String hintProduct = "Choose the product requested by the lead";

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
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
              CustomTextWidget(text: "Create New Lead",
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
                color: theme.colorScheme.tertiary.withOpacity(0.8),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(text: "First name",
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: theme.colorScheme.secondary,
                        ),
                        const SizedBox(height: 2.0),
                        CustomTextField(
                          controller: firstNameController,
                          hintText: "Enter lead's first name",
                          textColor: theme.colorScheme.secondary,
                          keyboardType: TextInputType.text,
                          filledColor: theme.colorScheme.secondary.withOpacity(
                              0.1),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(text: "Middle name",
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: theme.colorScheme.secondary,
                        ),
                        const SizedBox(height: 2.0),
                        CustomTextField(
                          controller: middleNameController,
                          hintText: "Enter lead's middle name",
                          textColor: theme.colorScheme.secondary,
                          keyboardType: TextInputType.text,
                          filledColor: theme.colorScheme.secondary.withOpacity(
                              0.1),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              CustomTextWidget(text: "Last name",
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.secondary,
              ),
              const SizedBox(height: 2.0),
              CustomTextField(
                controller: lastNameController,
                hintText: "Enter lead's last name",
                textColor: theme.colorScheme.secondary,
                keyboardType: TextInputType.text,
                filledColor: theme.colorScheme.secondary.withOpacity(0.1),
              ),
              const SizedBox(height: 10.0),
              CustomTextWidget(text: "Email",
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.secondary,
              ),
              const SizedBox(height: 2.0),
              CustomTextField(
                controller: emailController,
                hintText: "Enter lead's email address",
                textColor: theme.colorScheme.secondary,
                keyboardType: TextInputType.text,
                filledColor: theme.colorScheme.secondary.withOpacity(0.1),
              ),
              const SizedBox(height: 10.0),
              CustomTextWidget(text: "Phone number",
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.secondary,
              ),
              const SizedBox(height: 2.0),
              CustomTextField(
                controller: phoneNumberController,
                hintText: "Enter lead's phone number",
                textColor: theme.colorScheme.secondary,
                keyboardType: TextInputType.text,
                filledColor: theme.colorScheme.secondary.withOpacity(0.1),
              ),
              const SizedBox(height: 10.0),
              CustomTextWidget(text: "Location",
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.secondary,
              ),
              const SizedBox(height: 2.0),
              CustomTextField(
                controller: locationController,
                hintText: "Enter lead's location",
                textColor: theme.colorScheme.secondary,
                keyboardType: TextInputType.text,
                minLines: 2,
                maxLines: 5,
                filledColor: theme.colorScheme.secondary.withOpacity(0.1),
              ),
              const SizedBox(height: 10.0),
              CustomTextWidget(text: "Lead source",
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.secondary,
              ),
              const SizedBox(height: 2.0),
              // Container(
              //   padding:
              //   const EdgeInsets.only(right: 10.0, left: 10.0, top: 5.0, bottom: 5.0),
              //   decoration: BoxDecoration(
              //       borderRadius:
              //       const BorderRadius.all(Radius.circular(8.0)),
              //       color: theme.colorScheme.secondary.withOpacity(0.1)),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Expanded(
              //           child: DropdownButtonHideUnderline(
              //               child: ButtonTheme(
              //                   alignedDropdown: true,
              //                   child: DropdownButton<String>(
              //                       value: selectedLeadSource,
              //                       iconSize: 30,
              //                       icon: (null),
              //                       style: TextStyle(
              //                           color:
              //                           theme.colorScheme.secondary,
              //                           fontSize: 16.0,
              //                           fontFamily: 'DM Sans'),
              //                       hint: Text(
              //                         hintLeadSource,
              //                         style: TextStyle(
              //                           color: theme.hintColor,
              //                           fontSize: 14.0,
              //                           fontFamily: 'DM Sans',
              //                         ),
              //                       ),
              //                       items: allLeadSources.map((item) {
              //                         return DropdownMenuItem(
              //                           value: item,
              //                           child: Text(item,
              //                               style: TextStyle(
              //                                 fontFamily:
              //                                 'DM Sans',
              //                                 fontSize: 16.0,
              //                                 color: theme
              //                                     .colorScheme
              //                                     .secondary,
              //                               )),
              //                         );
              //                       }).toList(),
              //                       onChanged: (String? newValue) {
              //                         setState(() {
              //                         selectedLeadSource = newValue ?? selectedLeadSource;
              //                         });
              //                       }))))
              //     ],
              //   ),
              // ),
              DropdownWidget(
                  selectedItem: selectedLeadSource,
                  hintText: hintLeadSource,
                  itemsList: allLeadSources,
                  onSelection: (String? newValue) {
                    setState(() {
                      selectedLeadSource = newValue ?? selectedLeadSource;
                    });
                  }),
              const SizedBox(height: 10.0),
              CustomTextWidget(text: "Product requested",
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.secondary,
              ),
              const SizedBox(height: 2.0),
              // Container(
              //   padding:
              //   const EdgeInsets.only(right: 10.0, left: 10.0, top: 5.0, bottom: 5.0),
              //   decoration: BoxDecoration(
              //       borderRadius:
              //       const BorderRadius.all(Radius.circular(8.0)),
              //       color: theme.colorScheme.secondary.withOpacity(0.1)),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Expanded(
              //           child: DropdownButtonHideUnderline(
              //               child: ButtonTheme(
              //                   alignedDropdown: true,
              //                   child: DropdownButton<String>(
              //                       value: selectedProduct,
              //                       iconSize: 30,
              //                       icon: (null),
              //                       style: TextStyle(
              //                           color:
              //                           theme.colorScheme.secondary,
              //                           fontSize: 16.0,
              //                           fontFamily: 'DM Sans'),
              //                       hint: Text(
              //                         hintProduct,
              //                         style: TextStyle(
              //                           color: theme.hintColor,
              //                           fontSize: 14.0,
              //                           fontFamily: 'DM Sans',
              //                         ),
              //                       ),
              //                       items: allProducts.map((item) {
              //                         return DropdownMenuItem(
              //                           value: item,
              //                           child: Text(item,
              //                               style: TextStyle(
              //                                 fontFamily:
              //                                 'DM Sans',
              //                                 fontSize: 16.0,
              //                                 color: theme
              //                                     .colorScheme
              //                                     .secondary,
              //                               )),
              //                         );
              //                       }).toList(),
              //                       onChanged: (String? newValue) {
              //                         setState(() {
              //                           selectedProduct = newValue ?? selectedProduct;
              //                         });
              //                       }))))
              //     ],
              //   ),
              // ),
              DropdownWidget(
                  selectedItem: selectedProduct,
                  hintText: hintProduct,
                  itemsList: allProducts,
                  onSelection: (String? newValue) {
                    setState(() {
                      selectedProduct = newValue ?? selectedProduct;
                    });
                  }),
              const SizedBox(height: 50.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: BlocConsumer<LeadsBloc, LeadsState>(
                  listener: (innerContext, state) {
                    if (state is LeadCreatingSuccess) {
                      showSuccessDialog(
                          context: context,
                          buttonPressed: (){
                            context.read<LeadsBloc>().add(FetchAllLeadsEvent());
                            context.go('/dashboard');
                          },
                          buttonText: "Done",
                          title: "Lead Created",
                          description: "Details have been submitted and the lead has been created successfully."
                      );
                    }
                    else if(state is LeadCreatingFailure) {
                      showErrorDialog(
                          context: context,
                          buttonPressed: (){
                            context.pop();
                          },
                          title: "Failed",
                          description: "An error occurred while creating the lead. Please try again.\n Reason: ${state.errorMessage}"
                      );
                    }
                  },
                  builder: (innerContext, state) {
                    return state is LeadCreatingLoading ?
                    SubmissionProgress(
                        submissionText: "Creating lead in progress...",
                      textColor: theme.colorScheme.secondary,
                    ) : CustomElevatedButton(btnText: "Submit",
                        btnColor: theme.colorScheme.secondary,
                        textColor: theme.colorScheme.onSecondary,
                        fontWeight: FontWeight.w700,
                        textFontSize: 16.0,
                        radius: 90.0,
                        onPressed: () {
                      // fetching user name from profile
                          String agentName = "";
                      ProfileState profileState = context.read<ProfileBloc>().state;
                      if(profileState is ProfileSuccess){
                        agentName = "${profileState.profile.firstName} ${profileState.profile.middleName} ${profileState.profile.lastName}";
                      }

                          Lead newLeadData = Lead(
                            firstName: firstNameController.text,
                            middleName: middleNameController.text,
                            lastName: lastNameController.text,
                            location: locationController.text,
                            leadCreatedDate: DateTime.now().toString(),
                            leadContactedDate: "",
                            nextAppointmentDate: "",
                            leadSource: selectedLeadSource,
                            productRequested: selectedProduct,
                            productSold: "",
                            leadStatus: "new",
                            leadCloseReason: "",
                            recordingAgentName: agentName,
                          );
                          context.read<LeadsBloc>().add(CreateLeadEvent(lead: newLeadData));
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

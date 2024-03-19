import 'package:choice/choice.dart';
import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:dentsu_test/features/features_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddQuoteScreen extends StatefulWidget {
  const AddQuoteScreen({Key? key}) : super(key: key);

  @override
  State<AddQuoteScreen> createState() => _AddQuoteScreenState();
}

class _AddQuoteScreenState extends State<AddQuoteScreen> {
  final TextEditingController businessUnitController = TextEditingController();
  final TextEditingController capturingUserNameController = TextEditingController();
  final TextEditingController childrenNumberController = TextEditingController();

  List<Benefits> selectedBenefits = [];
  List<Benefits> choices = [];

  Lead selectedLead = Lead(id: "0", firstName: "Select lead name", middleName: "", lastName: "");
  Lead defaultLead = Lead(id: "0", firstName: "Select lead name", middleName: "", lastName: "");
  String hintLeadText = "Select lead name";
  List<Lead> leadsNameList = [];

  String selectedOriginatingLeadSource = "Select originating lead source";
  String hintOriginatingLeadSourceText = "Select originating lead source";
  List<String> originatingLeadSourceList = [
    "Select originating lead source",
    "Sales Agent",
    "Referral",
    "Social Media",
  ];

  String selectedSource = "Select source";
  String hintSourceText = "Select source";
  List<String> sourceList = [
    "Select source",
    "Agent portal",
    "Website",
  ];

  String selectedAgeBracket = "Select age bracket";
  String hintAgeBracketText = "Select age bracket";
  List<String> ageBracketList = [
    "Select age bracket",
    "18 to 30 years",
    "31 to 55 years",
    "55 years and above",
  ];

  String selectedInpatientCoverLimit = "Select the inpatient cover limit";
  String hintInpatientCoverLimitText = "Select the inpatient cover limit";
  List<String> inpatientCoverLimitList = [
    "Select the inpatient cover limit",
    "Ksh 500,000",
    "Ksh 1,000,000",
    "Ksh 2,000,000",
  ];

  String selectedSpouseCovered = "Select";
  String hintSpouseCoveredText = "Select";
  List<String> yesNoList = [
    "Select",
    "Yes",
    "No",
  ];

  String selectedChildrenCovered = "Select";
  String hintChildrenCoveredText = "Select";

  String selectedSpouseAgeBracket = "Select age bracket";
  String hintSpouseAgeBracketText = "Select age bracket";


  @override
  void initState() {
    super.initState();
    leadsNameList.add(defaultLead);
    context.read<BenefitsCubit>().fetchAllBenefits();
  }

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
                        text: "Back to all quotes",
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: theme.colorScheme.secondary),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomTextWidget(text: "Create New Quote",
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
                color: theme.colorScheme.tertiary.withOpacity(0.8),
              ),
              const SizedBox(height: 10.0),
              CustomTextWidget(text: "Client's details",
                fontWeight: FontWeight.w400,
                fontSize: 18.0,
                color: theme.colorScheme.tertiary.withOpacity(0.6),
              ),
              const Divider(),
              const SizedBox(height: 10.0),
              CustomTextWidget(text: "Lead name",
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.secondary,
              ),
              const SizedBox(height: 2.0),
              BlocBuilder<LeadsBloc, LeadsState>(
                builder: (context, state) {
                  if(state is LeadsLoaded){
                    leadsNameList.clear();
                    leadsNameList = [defaultLead, ...state.leads];
                  }
                  return Container(
                    padding:
                    const EdgeInsets.only(right: 10.0, left: 10.0, top: 5.0, bottom: 5.0),
                    decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(8.0)),
                        color: theme.colorScheme.secondary.withOpacity(0.1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                    alignedDropdown: true,
                                    child: DropdownButton<Lead>(
                                        value: selectedLead,
                                        iconSize: 30,
                                        icon: (null),
                                        style: TextStyle(
                                            color:
                                            theme.colorScheme.secondary,
                                            fontSize: 16.0,
                                            fontFamily: 'DM Sans'),
                                        hint: Text(
                                          "Select lead name",
                                          style: TextStyle(
                                            color: theme.hintColor,
                                            fontSize: 14.0,
                                            fontFamily: 'DM Sans',
                                          ),
                                        ),
                                        items: leadsNameList.map((item) {
                                          return DropdownMenuItem(
                                            value: item,
                                            child: Text("${item.firstName} ${item.middleName} ${item.lastName}",
                                                style: TextStyle(
                                                  fontFamily:
                                                  'DM Sans',
                                                  fontSize: 16.0,
                                                  color: item.id == "0" ? theme.hintColor : theme
                                                      .colorScheme
                                                      .secondary,
                                                )),
                                          );
                                        }).toList(),
                                        onChanged: (Lead? value) {
                                          setState(() {
                                            selectedLead = value ?? selectedLead;
                                          });
                                        }))))
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 10.0),
              CustomTextWidget(text: "Originating lead source",
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.secondary,
              ),
              const SizedBox(height: 2.0),
              DropdownWidget(
                  selectedItem: selectedOriginatingLeadSource,
                  hintText: hintOriginatingLeadSourceText,
                  itemsList: originatingLeadSourceList,
                  onSelection: (value) {
                    setState(() {
                      selectedOriginatingLeadSource = value ?? selectedOriginatingLeadSource;
                    });
                  }
              ),
              const SizedBox(height: 10.0),
              CustomTextWidget(text: "Owning business unit",
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.secondary,
              ),
              const SizedBox(height: 2.0),
              CustomTextField(
                controller: businessUnitController,
                textColor: theme.colorScheme.secondary,
                hintText: "Enter business unit",
                keyboardType: TextInputType.text,
                filledColor: theme.colorScheme.secondary.withOpacity(0.1),
              ),
              const SizedBox(height: 10.0),
              CustomTextWidget(text: "Source",
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.secondary,
              ),
              const SizedBox(height: 2.0),
              DropdownWidget(
                  selectedItem: selectedSource,
                  hintText: hintSourceText,
                  itemsList: sourceList,
                  onSelection: (value) {
                    setState(() {
                      selectedSource = value ?? selectedSource;
                    });
                  }),
              CustomTextWidget(text: "Capturing user",
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.secondary,
              ),
              const SizedBox(height: 2.0),
              CustomTextField(
                controller: capturingUserNameController,
                textColor: theme.colorScheme.secondary,
                hintText: "Enter user captured",
                keyboardType: TextInputType.text,
                filledColor: theme.colorScheme.secondary.withOpacity(0.1),
              ),
              const SizedBox(height: 10.0),
              CustomTextWidget(text: "Age bracket",
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.secondary,
              ),
              const SizedBox(height: 2.0),
              DropdownWidget(
                  selectedItem: selectedAgeBracket,
                  hintText: hintAgeBracketText,
                  itemsList: ageBracketList,
                  onSelection: (value) {
                    setState(() {
                      selectedAgeBracket = value ?? selectedAgeBracket;
                    });
                  }),
              const SizedBox(height: 10.0),
              CustomTextWidget(text: "InPatient cover limit (KES)",
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.secondary,
              ),
              const SizedBox(height: 2.0),
              DropdownWidget(
                  selectedItem: selectedInpatientCoverLimit,
                  hintText: hintInpatientCoverLimitText,
                  itemsList: inpatientCoverLimitList,
                  onSelection: (value) {
                    setState(() {
                      selectedInpatientCoverLimit = value ?? selectedInpatientCoverLimit;
                    });
                  }),
              const SizedBox(height: 10.0),
              CustomTextWidget(text: "Is the spouse covered?",
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.secondary,
              ),
              const SizedBox(height: 2.0),
              DropdownWidget(
                  selectedItem: selectedSpouseCovered,
                  hintText: hintSpouseCoveredText,
                  itemsList: yesNoList,
                  onSelection: (value) {
                    setState(() {
                      selectedSpouseCovered = value ?? selectedSpouseCovered;
                    });
                  }),
              const SizedBox(height: 10.0),
              CustomTextWidget(text: "What's the number of children?",
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.secondary,
              ),
              const SizedBox(height: 2.0),
              CustomTextField(
                controller: childrenNumberController,
                textColor: theme.colorScheme.secondary,
                hintText: "Enter number of children",
                keyboardType: TextInputType.number,
                filledColor: theme.colorScheme.secondary.withOpacity(0.1),
              ),
              const SizedBox(height: 10.0),
              CustomTextWidget(text: "Does it cover children?",
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.secondary,
              ),
              const SizedBox(height: 2.0),
              DropdownWidget(
                  selectedItem: selectedChildrenCovered,
                  hintText: hintChildrenCoveredText,
                  itemsList: yesNoList,
                  onSelection: (value) {
                    setState(() {
                      selectedChildrenCovered = value ?? selectedChildrenCovered;
                    });
                  }),
              const SizedBox(height: 10.0),
              CustomTextWidget(text: "Spouse age bracket",
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.secondary,
              ),
              const SizedBox(height: 2.0),
              DropdownWidget(
                  selectedItem: selectedSpouseAgeBracket,
                  hintText: hintSpouseAgeBracketText,
                  itemsList: ageBracketList,
                  onSelection: (value) {
                    setState(() {
                      selectedSpouseAgeBracket = value ?? selectedSpouseAgeBracket;
                    });
                  }),
              const SizedBox(height: 20.0),
              CustomTextWidget(text: "Benefit details",
                fontWeight: FontWeight.w400,
                fontSize: 18.0,
                color: theme.colorScheme.tertiary.withOpacity(0.6),
              ),
              const Divider(),
              const SizedBox(height: 10.0),
              BlocBuilder<BenefitsCubit, List<Benefits>>(
                builder: (context, state) {
                  choices = state;
                  return InlineChoice<Benefits>(
                    multiple: true,
                    clearable: true,
                    value: selectedBenefits,
                    onChanged: (value) {
                      setState(() {
                        selectedBenefits = value;
                      });
                    },
                    itemCount: choices.length,
                    itemBuilder: (selection, i) {
                      return ChoiceChip(
                        selected: selection.selected(choices[i]),
                        onSelected: selection.onSelected(choices[i]),
                        label: CustomTextWidget(
                          text: choices[i].benefitName ?? "",
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: theme.colorScheme.secondary,
                        ),
                      );
                    },
                    listBuilder: ChoiceList.createWrapped(
                      spacing: 10,
                      runSpacing: 10,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 25,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 50.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: BlocConsumer<QuotesBloc, QuotesState>(
                  listener: (innerContext, state) {
                    if (state is QuoteCreatingSuccess) {
                      showSuccessDialog(
                          context: context,
                          buttonPressed: () {
                            context.read<QuotesBloc>().add(
                                FetchAllQuotesEvent());
                            context.go('/dashboard');
                          },
                          buttonText: "Done",
                          title: "Quote Generated",
                          description: "Details have been submitted and the quote has been generated successfully."
                      );
                    }
                    else if (state is QuoteCreatingFailure) {
                      showErrorDialog(
                          context: context,
                          buttonPressed: () {
                            context.pop();
                          },
                          title: "Failed",
                          description: "An error occurred while generating the quote. Please try again.\n Reason: ${state
                              .errorMessage}"
                      );
                    }
                  },
                  builder: (innerContext, state) {
                    return
                      state is QuoteCreatingLoading ? SubmissionProgress(
                        submissionText: "Generating quote in progress...",
                        textColor: theme.colorScheme.secondary,
                      ) :
                      CustomElevatedButton(btnText: "Submit",
                          btnColor: theme.colorScheme.secondary,
                          textColor: theme.colorScheme.onSecondary,
                          fontWeight: FontWeight.w700,
                          textFontSize: 16.0,
                          radius: 90.0,
                          onPressed: () {
                        double totalCharges = 0.0;
                        for(Benefits benefit in selectedBenefits){
                          totalCharges = totalCharges + (double.tryParse(benefit.benefitCharges ?? "0") ?? 0);
                        }
                        List<String> benefitsStrings = [];
                        benefitsStrings = selectedBenefits.map((e) => e.benefitName ?? "").toList();
                            Quote newQuoteData = Quote(
                                clientFirstName: "${selectedLead.firstName}",
                                clientMiddleName: "${selectedLead.middleName}",
                                clientLastName: "${selectedLead.lastName}",
                                leadId: selectedLead.id,
                                originatingLeadSource: selectedOriginatingLeadSource,
                                owningBusinessUnit: businessUnitController.text,
  source: selectedSource,
  capturingUser: capturingUserNameController.text,
  ageBracket: selectedAgeBracket,
  inPatientCoverLimit: selectedInpatientCoverLimit,
  spouseCovered: selectedSpouseCovered,
  numberOfChildren: childrenNumberController.text,
  childrenCovered: selectedChildrenCovered,
  spouseAgeBracket: selectedSpouseAgeBracket,
  leadBenefit: LeadBenefit(
    inPatient: benefitsStrings.contains("InPatient"),
    outPatient: benefitsStrings.contains("OutPatient"),
    maternity: benefitsStrings.contains("Maternity"),
    dental: benefitsStrings.contains("Dental"),
    optical: benefitsStrings.contains("Optical"),
    coPayment: benefitsStrings.contains("CoPayment"),
    lastExpense: benefitsStrings.contains("LastExpense"),
    personalAccident: benefitsStrings.contains("PersonalAccident"),
    covidCover: benefitsStrings.contains("CovidCover"),
    amrefEvacuation: benefitsStrings.contains("AmrefEvacuation"),
    totalCharges: "$totalCharges"
  )


                            );
                            context.read<QuotesBloc>().add(CreateQuoteEvent(
                                quote: newQuoteData));
                          });
                  },
                ),
              ),
              const SizedBox(height: 10.0),

            ],
          ),
        ),
      ),
    );
  }
}

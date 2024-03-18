import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:dentsu_test/features/dashboard/dashboard_barrel.dart';
import 'package:flutter/material.dart';
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
                        keyboardType: TextInputType.text,
                        color: theme.colorScheme.secondary.withOpacity(0.1),
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
                        keyboardType: TextInputType.text,
                        color: theme.colorScheme.secondary.withOpacity(0.1),
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
              keyboardType: TextInputType.text,
              color: theme.colorScheme.secondary.withOpacity(0.1),
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
              keyboardType: TextInputType.text,
              color: theme.colorScheme.secondary.withOpacity(0.1),
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
              keyboardType: TextInputType.text,
              color: theme.colorScheme.secondary.withOpacity(0.1),
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
              keyboardType: TextInputType.text,
              minLines: 2,
              maxLines: 5,
              color: theme.colorScheme.secondary.withOpacity(0.1),
            ),
            const SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: CustomElevatedButton(btnText: "Submit",
                  btnColor: theme.colorScheme.secondary,
                  textColor: theme.colorScheme.onSecondary,
                  fontWeight: FontWeight.w700,
                  textFontSize: 16.0,
                  radius: 90.0,
                  onPressed: (){
                    // context.go('/login');
                  }),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}

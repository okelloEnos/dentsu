import 'package:flutter/material.dart';

class TwoOptionSelection extends StatelessWidget {
  final Function(bool?) onOptionSelected;
  final String textDescription;
  final String? optionOne;
  final String? optionTwo;
  final bool? isVertical;
  final bool? selectedOption;
  const TwoOptionSelection({super.key, required this.onOptionSelected,
    required this.textDescription, this.optionOne, this.optionTwo, this.isVertical, required this.selectedOption});


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.background,
      margin: const EdgeInsets.all(0.0),
      shadowColor: theme.colorScheme.primary,
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(textDescription,
              style: TextStyle( fontWeight: FontWeight.normal,
                fontSize: 16,
                color: theme.colorScheme.primary,
                fontFamily: 'Dm Sans',),),
            const SizedBox(height: 10.0,),
            (isVertical ?? false) ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  horizontalTitleGap: 0.0,
                  title: Text(optionOne ?? 'Yes',
                    style: TextStyle(fontFamily: 'Dm Sans', color: theme.colorScheme.primary, fontSize: 18, fontWeight: FontWeight.w600),),
                  leading: Radio(
                    // overlayColor: MaterialStateProperty.all(theme.colorScheme.primary),
                    value: true,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      onOptionSelected(true);
                    },
                  ),
                ),
                ListTile(
                  horizontalTitleGap: 0.0,
                  title: Text(optionTwo ?? 'No',
                    style: TextStyle(fontFamily: 'Dm Sans', color: theme.colorScheme.primary, fontSize: 18, fontWeight: FontWeight.w600),),
                  leading: Radio(
                    value: false,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      onOptionSelected(false);
                    },
                  ),
                ),
              ],
            ) :
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ListTile(
                    horizontalTitleGap: 0.0,
                    title: Text(optionOne ?? 'Yes',
                      style: TextStyle(fontFamily: 'Dm Sans', color: theme.colorScheme.primary, fontSize: 18, fontWeight: FontWeight.w600),),
                    leading: Radio(
                      value: true,
                      groupValue: selectedOption,
                      onChanged: (value) {
                          onOptionSelected(true);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    horizontalTitleGap: 0.0,
                    title: Text(optionTwo ?? 'No',
                      style: TextStyle(fontFamily: 'Dm Sans', color: theme.colorScheme.primary, fontSize: 18, fontWeight: FontWeight.w600),),
                    leading: Radio(
                      value: false,
                      groupValue: selectedOption,
                      onChanged: (value) {
                         onOptionSelected(false);
                      },
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}


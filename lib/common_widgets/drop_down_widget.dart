import 'package:flutter/material.dart';

class DropdownWidget extends StatelessWidget {
  final Color? filledColor;
  final String selectedItem;
  final Color? textColor;
  final String hintText;
  final List<String> itemsList;
  final Function(String?) onSelection;
  const DropdownWidget({super.key,
    this.filledColor,
    required this.selectedItem,
    this.textColor,
    required this.hintText,
    required this.itemsList,
    required this.onSelection
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding:
      const EdgeInsets.only(right: 10.0, left: 10.0, top: 5.0, bottom: 5.0),
      decoration: BoxDecoration(
          borderRadius:
          const BorderRadius.all(Radius.circular(8.0)),
          color: filledColor ?? theme.colorScheme.secondary.withOpacity(0.1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                          value: selectedItem,
                          iconSize: 30,
                          icon: (null),
                          style: TextStyle(
                              color:
                              textColor ?? theme.colorScheme.secondary,
                              fontSize: 16.0,
                              fontFamily: 'DM Sans'),
                          hint: Text(
                            hintText,
                            style: TextStyle(
                              color: theme.hintColor,
                              fontSize: 14.0,
                              fontFamily: 'DM Sans',
                            ),
                          ),
                          items: itemsList.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item,
                                  style: TextStyle(
                                    fontFamily:
                                    'DM Sans',
                                    fontSize: 16.0,
                                    color: selectedItem == itemsList.first ? theme.hintColor : textColor ?? theme
                                        .colorScheme
                                        .secondary,
                                  )),
                            );
                          }).toList(),
                          onChanged: onSelection))))
        ],
      ),
    );
  }
}

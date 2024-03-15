import 'package:flutter/material.dart';

class CustomDropdownWidget extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onSelectionChanged;
  final List<String> optionList;
  final String hintText;
  final Future fetchInitialization;
  final bool? isDisabled;

  const CustomDropdownWidget({Key? key, required this.controller, required this.hintText, this.isDisabled,
    required this.onSelectionChanged, required this.optionList, required this.fetchInitialization}) : super(key: key);

  @override
  CustomDropdownWidgetState createState() => CustomDropdownWidgetState();
}

class CustomDropdownWidgetState extends State<CustomDropdownWidget> {
  List<String> optionList = [];
  String selectedOption =  '';


  @override
  void initState() {
    super.initState();
    // optionList = widget.optionList;
    selectedOption = widget.hintText;
    contentInitialization();
  }

  contentInitialization() async{
    optionList.add(selectedOption);
    List<String> optionListFetched = await widget.fetchInitialization as List<String>;
    optionList.clear();
    optionList = optionListFetched;
    updateSelection();

  }

  updateSelection(){

    setState(() {
      String optionName = widget.controller.text;
      if(optionList.isNotEmpty && widget.controller.text.isNotEmpty){
        selectedOption = optionList.where((element) => (element.toLowerCase() == optionName.toLowerCase())).first;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
   var theme = Theme.of(context);
    return  InputDecorator(
      decoration: InputDecoration(
        suffixIconColor: theme.colorScheme.primary,
        filled: true,
        fillColor: theme.colorScheme.primary.withOpacity(0.1),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
                color: Colors.white),
            gapPadding: 2.0),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
                color: Colors.white),
            gapPadding: 2.0),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
                color: Colors.white),
            gapPadding: 2.0),
        contentPadding: const EdgeInsets.all(5),
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            iconDisabledColor: theme.colorScheme.primary,
            iconEnabledColor: theme.colorScheme.primary,
            // dropdownColor: mainColor,
            value: selectedOption,
            // items: null,
            items: optionList.map<DropdownMenuItem<String>>((String value){
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    fontFamily: 'Dm Sans'),),
              );
            }).toList(),
            onChanged: (widget.isDisabled ?? false) ? null : (String? value){
              setState(() {
                selectedOption = value ?? selectedOption;
                widget.controller.text = selectedOption;
                widget.onSelectionChanged(selectedOption);

              });
            },
          ),
        ),
      ),
    );

  }
}

// class CustomDropdownWidget extends StatefulWidget {
//   final TextEditingController controller;
//   final Function(String) onSelectionChanged;
//   final List<String> optionList;
//   final String hintText;
//   final Future fetchInitialization;
//   final bool? isDisabled;
//
//   const CustomDropdownWidget({Key? key, required this.controller, required this.hintText, this.isDisabled,
//     required this.onSelectionChanged, required this.optionList, required this.fetchInitialization}) : super(key: key);
//
//   @override
//   CustomDropdownWidgetState createState() => CustomDropdownWidgetState();
// }
//
// class CustomDropdownWidgetState extends State<CustomDropdownWidget> {
//   List<String> optionList = [];
//   String selectedOption =  '';
//
//
//   @override
//   void initState() {
//     super.initState();
//     // optionList = widget.optionList;
//     selectedOption = widget.hintText;
//     contentInitialization();
//   }
//
//   contentInitialization() async{
//     optionList.add(selectedOption);
//     List<String> optionListFetched = await widget.fetchInitialization as List<String>;
//     optionList.clear();
//     optionList = optionListFetched;
//     updateSelection();
//
//   }
//
//   updateSelection(){
//
//     setState(() {
//       String optionName = widget.controller.text;
//       if(optionList.isNotEmpty && widget.controller.text.isNotEmpty){
//         selectedOption = optionList.where((element) => (element.toLowerCase() == optionName.toLowerCase())).first;
//       }
//     });
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);
//     return  InputDecorator(
//       decoration: InputDecoration(
//         suffixIconColor: theme.colorScheme.primary,
//         filled: true,
//         fillColor: theme.colorScheme.primary.withOpacity(0.1),
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//             borderSide: const BorderSide(
//                 color: Colors.white),
//             gapPadding: 2.0),
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//             borderSide: const BorderSide(
//                 color: Colors.white),
//             gapPadding: 2.0),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//             borderSide: const BorderSide(
//                 color: Colors.white),
//             gapPadding: 2.0),
//         contentPadding: const EdgeInsets.all(5),
//       ),
//       child: DropdownButtonHideUnderline(
//         child: ButtonTheme(
//           alignedDropdown: true,
//           child: DropdownButton<String>(
//             iconDisabledColor: theme.colorScheme.primary,
//             iconEnabledColor: theme.colorScheme.primary,
//             // dropdownColor: mainColor,
//             value: selectedOption,
//             // items: null,
//             items: optionList.map<DropdownMenuItem<String>>((String value){
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value, style: TextStyle(
//                     color: theme.colorScheme.primary,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 16.0,
//                     fontFamily: 'Dm Sans'),),
//               );
//             }).toList(),
//             onChanged: (widget.isDisabled ?? false) ? null : (String? value){
//               setState(() {
//                 selectedOption = value ?? selectedOption;
//                 widget.controller.text = selectedOption;
//                 widget.onSelectionChanged(selectedOption);
//
//               });
//             },
//           ),
//         ),
//       ),
//     );
//
//   }
// }
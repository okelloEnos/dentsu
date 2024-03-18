import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:dentsu_test/features/features_barrel.dart';
import 'package:dentsu_test/util/util_barrel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../util/constants/constants_barrel.dart';
final List<Quote> _quotes = [
  Quote(text: "text1", author: "ENOS1"),
  Quote(text: "text2", author: "ENOS2"),
  Quote(text: "text3", author: "ENOS3"),
  Quote(text: "text4", author: "ENOS4"),
  Quote(text: "text5", author: "ENOS5"),
];

class QuotesWidget extends StatelessWidget {
  const QuotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: PaginatedDataTable(
            rowsPerPage: _quotes.length < 10 ? _quotes.length : 10,
            header: const CustomTextWidget(text: ""),
            columns: <DataColumn>[
              DataColumn(
                label: CustomTextWidget(text: "#", fontSize: 14.0, fontWeight: FontWeight.w400, color: theme.colorScheme.tertiary,),
              ),
              DataColumn(
                label: CustomTextWidget(text: "Customer Name", fontSize: 14.0, fontWeight: FontWeight.w400, color: theme.colorScheme.tertiary,),
              ),
              DataColumn(
                label: CustomTextWidget(text: "", fontSize: 14.0, fontWeight: FontWeight.w400, color: theme.colorScheme.tertiary,),
              ),
            ],
            source: QuotesDataSource(quotes: _quotes, onRowTap: (quoteIndex){
              context.go('/dashboard/view_quote');
            }),
          ),
        ),
        Positioned(
            top: 20.0,
            left: 0.0,
            right: 0.0,
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 10.0),
                    child: CustomTextWidget(text: "Quotes",
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: theme.colorScheme.tertiary.withOpacity(0.8),
                    ),
                  ),
                  Divider(
                    color: theme.hintColor.withOpacity(0.4),
                  )
                ],
              ),
            )),
        const Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Card(child: PaginationFooter())),
      ],
    );
  }
}

class QuotesDataSource extends DataTableSource {
  final List<Quote> quotes ;
  final Function(int) onRowTap;

  QuotesDataSource({Key? key, required this.quotes, required this.onRowTap});

  @override
  int get rowCount => quotes.length;

  @override
  DataRow? getRow(int index) {
    return DataRow(
      selected: index % 2 == 0,
      cells: <DataCell>[
        DataCell(CustomTextWidget(text: preserveLeadingZero(index + 1),
            color: black,
            fontSize: 14.0,
            fontFamily: "DM Sans",
            fontWeight: FontWeight.w400
        )),
        DataCell(CustomTextWidget(text: quotes[index].text ?? "",
            color: black,
            fontSize: 14.0,
            fontFamily: "DM Sans",
            fontWeight: FontWeight.w400
        )),
        DataCell(
          const Icon(Icons.remove_red_eye_outlined, color: lightPrimaryColor, size: 20.0,),
          onTap: (){
            onRowTap(index);
          },
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}

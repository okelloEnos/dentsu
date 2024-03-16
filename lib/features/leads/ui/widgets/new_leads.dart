import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:dentsu_test/features/features_barrel.dart';
import 'package:dentsu_test/features/leads/ui/widgets/pagination_footer.dart';
import 'package:flutter/material.dart';

import '../../../../util/constants/constants_barrel.dart';
final List<Lead> _leads = [
  Lead(id: "1", name: "Sarah"),
  Lead(id: "2", name:"John"),
  Lead(id: "3", name: "James"),
  Lead(id: "4", name: "Peter"),
  Lead(id: "5", name: "Peter"),
  Lead(id: "6", name: "Peter"),
  Lead(id: "7", name: "Peter"),
  Lead(id: "8", name: "Peter"),
  Lead(id: "9", name: "Peter"),
  Lead(id: "10", name: "Peter"),
  Lead(id: "11", name: "Peter"),
  Lead(id: "12", name: "Peter"),
];
final DataTableSource dataSource = LeadsDataSource(leads: _leads);
class NewLeads extends StatelessWidget {
  const NewLeads({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: PaginatedDataTable(
            rowsPerPage: _leads.length < 10 ? _leads.length : 10,
            header: const CustomTextWidget(text: ""),
            // header: Column(
            //   mainAxisSize: MainAxisSize.min,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     const Spacer(),
            //     CustomTextWidget(text: "New Leads",
            //       fontSize: 20.0,
            //       fontWeight: FontWeight.w400,
            //       color: theme.colorScheme.tertiary.withOpacity(0.8),
            //     ),
            //     const Spacer(),
            //     Divider(
            //       color: theme.hintColor.withOpacity(0.4),
            //     )
            //   ],
            // ),
            columns: <DataColumn>[
              DataColumn(
                label: CustomTextWidget(text: "#", fontSize: 14.0, fontWeight: FontWeight.w400, color: theme.colorScheme.tertiary,),
              ),
              DataColumn(
                label: CustomTextWidget(text: "Customer Name", fontSize: 14.0, fontWeight: FontWeight.w400, color: theme.colorScheme.tertiary,),
              ),
            ],
            source: dataSource,
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
                    child: CustomTextWidget(text: "New Leads",
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

class LeadsDataSource extends DataTableSource {
  final List<Lead> leads ;

  LeadsDataSource({Key? key, required this.leads});

  @override
  int get rowCount => leads.length;

  @override
  DataRow? getRow(int index) {
    return DataRow(
      selected: index % 2 == 0,
      cells: <DataCell>[
        DataCell(CustomTextWidget(text: leads[index].id ?? "",
            color: black,
            fontSize: 14.0,
            fontFamily: "DM Sans",
            fontWeight: FontWeight.w400
        )),
        DataCell(CustomTextWidget(text: leads[index].name ?? "",
            color: black,
            fontSize: 14.0,
            fontFamily: "DM Sans",
            fontWeight: FontWeight.w400
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}

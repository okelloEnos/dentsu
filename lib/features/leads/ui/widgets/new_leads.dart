import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:dentsu_test/features/features_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../util/util_barrel.dart';
// final List<Lead> _leads = [
//   Lead(id: "1", firstName: "John", middleName: "Sam", lastName: "Derrick",),
//   Lead(id: "2", firstName: "John1", middleName: "Sam1", lastName: "Derrick1",),
//   Lead(id: "3", firstName: "John2", middleName: "Sam2", lastName: "Derrick2",),
//   Lead(id: "4", firstName: "John3", middleName: "Sam3", lastName: "Derrick3",),
//   Lead(id: "5", firstName: "John4", middleName: "Sam4", lastName: "Derrick4",),
//   Lead(id: "6", firstName: "John5", middleName: "Sam5", lastName: "Derrick5",),
//   Lead(id: "7", firstName: "John6", middleName: "Sam6", lastName: "Derrick6",),
//   Lead(id: "8", firstName: "John7", middleName: "Sam7", lastName: "Derrick7",),
//   Lead(id: "9", firstName: "John8", middleName: "Sam8", lastName: "Derrick8",),
//   Lead(id: "10", firstName: "John9", middleName: "Sam9", lastName: "Derrick9",),
//   Lead(id: "11", firstName: "John10", middleName: "Sam10", lastName: "Derrick10",),
//   Lead(id: "12", firstName: "John11", middleName: "Sam11", lastName: "Derrick11",),
//   Lead(id: "13", firstName: "John12", middleName: "Sam12", lastName: "Derrick12",),
// ];
// // final DataTableSource dataSource = LeadsDataSource(leads: _leads);
class NewLeads extends StatelessWidget {
  const NewLeads({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocBuilder<LeadsBloc, LeadsState>(
  builder: (context, state) {
    if(state is LeadsLoaded){
      final List<Lead> leads = state.leads;
      return
        leads.isEmpty ?  Center(child: CustomTextWidget(text: "No leads yet", fontSize: 16.0, fontWeight: FontWeight.w400, color: theme.hintColor,))
:
      Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: PaginatedDataTable(
              onPageChanged: (page){
                print("Page: $page");
              },
              rowsPerPage: leads.length < 10 ? leads.length : 10,
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
              source: LeadsDataSource(leads: leads, onRowTap: (leadIndex){
                context.go('/dashboard/view_lead', extra: {
                  "lead": leads[leadIndex],
                  "index": leadIndex
                });
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
    else if(state is LeadsFailure){
      return Center(child: CustomTextWidget(text: state.errorMessage, fontSize: 16.0, fontWeight: FontWeight.w400, color: theme.colorScheme.error,));
    }
    else if(state is LeadsLoading){
      return Center(child: CircularSpinProgress(
        spinColor: theme.colorScheme.secondary,
      ));
    }
    else{
      return const SizedBox.shrink();
    }

  },
);
  }
}

class LeadsDataSource extends DataTableSource {
  final List<Lead> leads ;
  final Function(int) onRowTap;

  LeadsDataSource({Key? key, required this.leads, required this.onRowTap});

  @override
  int get rowCount => leads.length;

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
        DataCell(CustomTextWidget(text: "${leads[index].firstName} ${leads[index].middleName} ${leads[index].lastName}" ?? "",
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

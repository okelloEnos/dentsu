import 'package:dentsu_test/features/features_barrel.dart';
import 'package:flutter/material.dart';

class LeadMoreDetailCard extends StatefulWidget {
  final Lead lead;
  const LeadMoreDetailCard({Key? key, required this.lead}) : super(key: key);

  @override
  State<LeadMoreDetailCard> createState() => _LeadMoreDetailCardState();
}

class _LeadMoreDetailCardState extends State<LeadMoreDetailCard> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 20.0, bottom: 0.0
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                onTap: (index) {
                  setState(() {
                    tabIndex = index;
                  });
                },
                overlayColor: MaterialStateProperty.all(theme.hintColor.withOpacity(0.2)),
                dividerColor: Colors.transparent,
                labelPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                unselectedLabelColor: theme.colorScheme.tertiary.withOpacity(0.4),
                labelColor: theme.colorScheme.secondary,
                controller: _tabController,
                indicatorColor: theme.colorScheme.secondary,
                unselectedLabelStyle: const TextStyle(fontSize: 16.0, fontFamily: 'DM Sans', fontWeight: FontWeight.w500),
                labelStyle:
                const TextStyle(fontSize: 16.0, fontFamily: 'DM Sans', fontWeight: FontWeight.w500),
                tabs: const [
                  // Tab(
                  //     text: "Customer  Details"
                  // ),
                  Tab(
                    text: "Lead Details",
                  ),
                  Tab(
                      text: "Assigned Lead"
                  ),

                  // Tab(
                  //     text: "Follow Up"
                  // ),
                  // Tab(
                  //     text: "Transactional Data"
                  // ),
                ]),
            Expanded(
                child: Container(
                  padding: EdgeInsets.zero,
                  child: TabBarView(
                    controller: _tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: LeadDetailSection(
                          lead: widget.lead,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: AssignedLeadSection(),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

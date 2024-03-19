import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:dentsu_test/features/features_barrel.dart';
import 'package:flutter/material.dart';

class ViewQuoteScreen extends StatefulWidget {
  final Quote quote;
  const ViewQuoteScreen({Key? key, required this.quote}) : super(key: key);

  @override
  State<ViewQuoteScreen> createState() => _ViewQuoteScreenState();
}

class _ViewQuoteScreenState extends State<ViewQuoteScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 20.0, bottom: 0.0
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextWidget(
              text: "View Quote",
              fontSize: 30.0,
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.tertiary.withOpacity(0.8),
            ),
            const SizedBox(height: 10.0),
            TabBar(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                onTap: (index) {
                  setState(() {
                    tabIndex = index;
                  });
                },
                overlayColor: MaterialStateProperty.all(theme.hintColor.withOpacity(0.2)),
                dividerColor: theme.hintColor.withOpacity(0.5),
                labelPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                unselectedLabelColor: theme.colorScheme.tertiary.withOpacity(0.4),
                labelColor: theme.colorScheme.secondary,
                controller: _tabController,
                indicatorColor: theme.colorScheme.secondary,
                unselectedLabelStyle: const TextStyle(fontSize: 14.0, fontFamily: 'DM Sans', fontWeight: FontWeight.w500),
                labelStyle:
                const TextStyle(fontSize: 14.0, fontFamily: 'DM Sans', fontWeight: FontWeight.w500),
                tabs: const [
                  Tab(
                    text: "Quote Information",
                  ),
                  Tab(
                      text: "Setup"
                  ),
                  Tab(
                      text: "Benefits"
                  ),
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
                        child: QuoteInformation(
                          quote: widget.quote,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: SetUp(
                          quote: widget.quote,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: BenefitsWidget(
                          quote: widget.quote,
                        ),
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

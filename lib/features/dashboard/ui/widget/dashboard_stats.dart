import 'package:dentsu_test/features/features_barrel.dart';
import 'package:flutter/material.dart';

class DashboardStats extends StatelessWidget {
  const DashboardStats({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: const [
        SizedBox(
            width: 240.0,
            child: TotalLeadsStatCard()),
        SizedBox(width: 20,),
        SizedBox(
            width: 240.0,
            child: GraphLeadsStat()),
        SizedBox(width: 20,),
        SizedBox(
            width: 240.0,
            child: RequestsStats()),
        SizedBox(width: 20,),
        SizedBox(
            width: 240.0,
            child: TopProductsStats()),
      ],
    );
  }
}

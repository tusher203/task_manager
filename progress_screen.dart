import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui.widgets/item_card.dart';
import '../ui.widgets/profile_summary.dart';
import '../ui.widgets/summary_card.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProfileSummary(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SummaryCard(
                    count: '09',
                    title: 'Canceled',
                  ),
                  SummaryCard(
                    count: '09',
                    title: 'Completed',
                  ),
                  SummaryCard(
                    count: '09',
                    title: 'Progress',
                  ),
                  SummaryCard(
                    count: '09',
                    title: 'New Task',
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ItemCard();
                },),
            )
          ],
        ),
      ),
    );
  }
}

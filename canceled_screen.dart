import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui.widgets/item_card.dart';
import '../ui.widgets/profile_summary.dart';
import '../ui.widgets/summary_card.dart';

class CancelledScreen extends StatefulWidget {
  const CancelledScreen({super.key});

  @override
  State<CancelledScreen> createState() => _CancelledScreenState();
}

class _CancelledScreenState extends State<CancelledScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SummaryCard extends StatefulWidget {
  const SummaryCard({
    super.key,
    this.count,
    this.title,
  });

  final count, title;

  @override
  State<SummaryCard> createState() => _SummaryCardState();
}

class _SummaryCardState extends State<SummaryCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:25, horizontal: 18),
        child: Column(
          children: [
            Text(widget.count,style: Theme.of(context).textTheme.titleLarge,),
            Text(widget.title,style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
      ),
    );
  }
}

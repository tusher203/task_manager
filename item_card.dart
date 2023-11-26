import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title'),
            Text('Description'),
            Text('Date:11/11/2023'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(
                    'New',
                    style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  backgroundColor: Colors.blue,
                ),

                Wrap(
                  children: [
                    Icon(Icons.edit,color: Colors.green,),
                    Icon(Icons.delete,color: Colors.red,),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
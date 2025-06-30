
import 'package:flutter/material.dart';


class MuviesList extends StatelessWidget {
  const MuviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(height: 100, width: 100, color: Colors.white),
            SizedBox(height: 700),
            Container(height: 100, width: 100, color: Colors.white),
            SizedBox(height: 700),
          ],
        ),
      ),
    );
  }
}

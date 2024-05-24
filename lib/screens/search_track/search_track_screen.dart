import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTrackScreen extends StatelessWidget {
  const SearchTrackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Track"),
      ),
      body: Center(
        child: Container(
          height: 300.h,
          width: 200.h,
          child: Card(
            color: Colors.greenAccent,
            child: Column(
              children: [
                Container(),

              ],
            ),
          ),
        ),
      )
    );
  }
}

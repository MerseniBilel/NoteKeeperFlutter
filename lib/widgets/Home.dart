import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notekeeper/components/OneNote.dart';
import 'package:notekeeper/widgets/AddNote.dart';
import '../globals.dart';
import 'dart:math';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final colorsArray = [
    Color(0xFFFFA993),
    Color(0xFFFFAB91),
    Color(0xFFE8ED9B),
    Color(0xFFD094DA),
    Color(0xFF82DEEB),
    Color(0xFFF48FB1),
    Color(0xFF7FCAC3),
  ];

  int _randomColorNumber() {
    Random random = new Random();
    return random.nextInt(7); // from 0 upto 99 included
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add, size: 30.0),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AddNote(),
          ),
        ),
        elevation: 15,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: SafeArea(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notes',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: boxdecColor,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Icon(
                    Icons.search,
                    size: 30.0,
                    color: textColor,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: StaggeredGridView.countBuilder(
                staggeredTileBuilder: (index) =>
                    StaggeredTile.count(2, index.isEven ? 3 : 2),
                mainAxisSpacing: 8,
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                itemCount: 50,
                itemBuilder: (context, index) =>
                    noteCard(index, colorsArray[_randomColorNumber()]),
              ),
            )
          ],
        )),
      ),
    );
  }
}

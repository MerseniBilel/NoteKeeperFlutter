import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../globals.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final _formkey = GlobalKey<FormState>();

  String _title = '';
  String _noteContent = '';
  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 30),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: boxdecColor,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              size: 25.0,
                              color: textColor,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => print('save the article'),
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: boxdecColor,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Center(
                            child: Text(
                              'Save',
                              style: GoogleFonts.roboto(
                                textStyle:
                                    Theme.of(context).textTheme.headline6,
                                fontWeight: FontWeight.w500,
                                color: textColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Title',
                              hintStyle: GoogleFonts.roboto(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
                                color: hintColor,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: GoogleFonts.roboto(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            color: contentColor,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Type something...',
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 25.0,
                                color: hintColor,
                                fontWeight: FontWeight.w400,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

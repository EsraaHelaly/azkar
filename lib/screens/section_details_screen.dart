import 'dart:convert';

import 'package:azkar/models/section_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionDetailsScreen extends StatefulWidget {
  const SectionDetailsScreen({
    Key? key,
    required this.id,
    required this.sectionName,
  }) : super(key: key);
  final int id;
  final String sectionName;

  @override
  State<SectionDetailsScreen> createState() => _SectionDetailsScreenState();
}

class _SectionDetailsScreenState extends State<SectionDetailsScreen> {
  List<SectionDetailsModel> sectionDetails = [];

  @override
  void initState() {
    super.initState();
    _loadSectionDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text(
          widget.sectionName,
          style: GoogleFonts.tajawal(),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: sectionDetails.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(color: Colors.transparent);
        },
        itemBuilder: (BuildContext context, int index) {
          int _counter = int.parse(sectionDetails[index].count!);

          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              sectionDetails.removeAt(index);
            },
            child: GestureDetector(
              onTap: () {
                if (_counter != 0) {
                  _counter--;
                }
                if (_counter <= 0) {
                  sectionDetails.removeAt(index);
                  setState(() {});
                }

                print(_counter);
              },
              child: Container(
                margin: EdgeInsets.only(top: 3.h, left: 10.w, right: 10.w),
                padding: EdgeInsets.all(5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[100],
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(.5))],
                ),
                child: ListTile(
                  subtitle: Text(
                    "${sectionDetails[index].reference}",
                    textDirection: TextDirection.ltr,
                  ),
                  title: Text(
                    "${sectionDetails[index].content}",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                  leading: CircleAvatar(
                    child: Text("$_counter"),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _loadSectionDetails() {
    //reset list to not save previous data
    sectionDetails = [];
    DefaultAssetBundle.of(context)
        .loadString('assets/database/section_details_db.json')
        .then((data) {
      var response = jsonDecode(data);
      response.forEach((section) {
        SectionDetailsModel _sectionDetailsModel =
            SectionDetailsModel.fromJson(section);

        if (_sectionDetailsModel.sectionId == widget.id) {
          sectionDetails.add(_sectionDetailsModel);
        }
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}

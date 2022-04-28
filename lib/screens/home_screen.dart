import 'dart:convert';

import 'package:azkar/models/section_model.dart';
import 'package:azkar/screens/sebha_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../componants/build_section_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SectionModel> sections = [];

  @override
  void initState() {
    super.initState();
    _loadSection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'اذكار المسلم',
          style: GoogleFonts.tajawal(),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => (const SebhaScreen()))));
            },
            child: const Icon(Icons.countertops),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.h),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: sections.length,
          itemBuilder: (BuildContext context, int index) {
            return BuildSectionItem(sectionModel: sections[index]);
          },
        ),
      ),
    );
  }

  //load json data
  //jsonDecode convert string to map/json object

  void _loadSection() {
    DefaultAssetBundle.of(context)
        .loadString('assets/database/sections_db.json')
        .then((data) {
      var response = jsonDecode(data);
      response.forEach((section) {
        SectionModel _sectionModel = SectionModel.fromJson(section);
        sections.add(_sectionModel);
      });
      setState(() {});
    }).catchError((error) {
      // print(error);
    });
  }
}

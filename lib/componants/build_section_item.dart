import 'package:azkar/models/section_model.dart';
import 'package:azkar/screens/section_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildSectionItem extends StatelessWidget {
  const BuildSectionItem({
    Key? key,
    required this.sectionModel,
  }) : super(key: key);
  final SectionModel sectionModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) => SectionDetailsScreen(
                id: sectionModel.id!, sectionName: sectionModel.name!))));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.purple,
        ),
        margin: EdgeInsets.all(5.h),
        height: 100.h,
        width: 100.w,
        child: Center(
          child: Text(
            sectionModel.name!,
            style: GoogleFonts.tajawal(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionDetails extends StatelessWidget {
  const SectionDetails({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$id",
          style: GoogleFonts.tajawal(),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
    );
  }
}

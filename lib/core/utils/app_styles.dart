import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  static TextStyle popularMovieTitle = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: Colors.white,
  );
  static TextStyle popularMovieDesc = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
    color: const Color(0xFFB5B4B4),
  );
  static TextStyle newReleasesListTitle = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 15.sp,
    color: Colors.white,
  );
}

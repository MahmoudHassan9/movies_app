import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/app_colors.dart';

abstract class AppStyles {
  static TextStyle popularMovieTitle = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: Colors.white,
  );


  //// abc
  static TextStyle popularMovieDesc = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
    color: const Color(0xFFB5B4B4),
  );
  static TextStyle homeListTitle = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 15.sp,
    color: Colors.white,
  );
  static TextStyle overview = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: AppColors.overview,
  );
  static TextStyle rateText = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
    color: Colors.white,
  );
  static TextStyle movieDetailsTitle = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 20.sp,
    color: Colors.white,
  );
}

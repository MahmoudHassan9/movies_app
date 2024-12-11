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
  static TextStyle popularMovieDesc = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
    color: const Color(0xFFB5B4B4),
  );

  static TextStyle browseTitle = GoogleFonts.inter(
    color: Colors.white,
    fontSize: 25.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle categoryName = GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle movieDetailsName = GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 13.sp,
    fontWeight: FontWeight.w300,
  );
  static TextStyle movieDetailsAppBar = GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle movieDetailsReleaseDate = GoogleFonts.poppins(
    color: Colors.grey,
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle movieDetailsOverView = GoogleFonts.poppins(
    color: Colors.grey,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle searchHint = GoogleFonts.inter(
    color: Colors.grey,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
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

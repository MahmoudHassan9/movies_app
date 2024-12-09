import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/data/models/movie_categories_details/Results.dart';
import '../../../../data/api/api_manager.dart';
import '../widget/search_item_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String _query = '';
  List<Results> _searchResults = [];
  bool _isLoading = false;
  String? _error;

  Future<void> _search(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
        _error = null;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      var resultResponse = await ApiManager.getSearchResults(query);
      setState(() {
        _searchResults = resultResponse
            .results!;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: TextField(
            onChanged: (value) {
              _query = value;
               _search(_query);
            },
            style: AppStyles.searchHint
                .copyWith(color: Colors.white, fontSize: 18.sp),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
                size: 30.sp,
              ),
              hintText: AppConstants.search,
              hintStyle: AppStyles.searchHint,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0.5.w),
                borderRadius: BorderRadius.all(Radius.circular(28.r)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0.5.w),
                borderRadius: BorderRadius.all(Radius.circular(25.r)),
              ),
              fillColor: AppColors.searchBar,
              filled: true,
            ),
          ),
        ),
        Expanded(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _error != null
                  ? Center(
                      child: Text(_error!, style: const TextStyle(color: Colors.red)))
                  : _searchResults.isEmpty
                      ? const Center(
                          child: Text(AppConstants.noResult,
                              style: TextStyle(color: Colors.white)))
                      : ListView.separated(
                          itemCount: _searchResults.length,
                          separatorBuilder: (context, index) =>
                              Divider(
                                  color: Colors.grey,
                                endIndent: 20.w,
                                indent: 20.w,
                              ),
                          itemBuilder: (context, index) {
                            final item = _searchResults[index];
                            return SearchItemWidget(
                              results: item,
                            );
                          },
                        ),
        ),
      ],
    );
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api/api_manager.dart' as _i442;
import '../../data/api/firebase_service.dart' as _i867;
import '../../data/data_source_contract/categories_data_source_contract.dart'
    as _i125;
import '../../data/data_source_contract/more_like_this_movies_data_source_contract.dart'
    as _i7;
import '../../data/data_source_contract/movie_based_on_category.dart' as _i270;
import '../../data/data_source_contract/new_releases_movies_data_source_contract.dart'
    as _i591;
import '../../data/data_source_contract/popular_movies_data_source_contract.dart'
    as _i349;
import '../../data/data_source_contract/recommended_movies_data_source_contract.dart'
    as _i269;
import '../../data/data_source_contract/search_data_source_contract.dart'
    as _i757;
import '../../data/data_source_contract/watch_list_movies_data_source_contract.dart'
    as _i170;
import '../../data/data_source_impl/categories_data_source_impl.dart' as _i533;
import '../../data/data_source_impl/more_like_this_movies_api_data_source_impl.dart'
    as _i855;
import '../../data/data_source_impl/movies_based_on_category_impl.dart'
    as _i539;
import '../../data/data_source_impl/new_releases_movies_api_data_source_impl.dart'
    as _i663;
import '../../data/data_source_impl/popular_movies_api_data_source.dart'
    as _i1053;
import '../../data/data_source_impl/recommended_movies_api_data_source_impl.dart'
    as _i459;
import '../../data/data_source_impl/search_data_source_impl.dart' as _i949;
import '../../data/data_source_impl/watch_list_movies_data_source_impl.dart'
    as _i581;
import '../../data/repo_impl/categories_repo_impl.dart' as _i807;
import '../../data/repo_impl/more_like_this_repo_impl.dart' as _i314;
import '../../data/repo_impl/movies_based_on_category_repo_impl.dart' as _i346;
import '../../data/repo_impl/new_releases_movie_impl.dart' as _i659;
import '../../data/repo_impl/popular_movies_repo_impl.dart' as _i877;
import '../../data/repo_impl/recommended_movies_repo_impl.dart' as _i235;
import '../../data/repo_impl/search_repo_impl.dart' as _i1008;
import '../../data/repo_impl/watch_list_repo_impl.dart' as _i997;
import '../../domain/repo_contract/categories_movies_repo.dart' as _i728;
import '../../domain/repo_contract/more_like_this_repo_impl.dart' as _i1013;
import '../../domain/repo_contract/moveis_based_on_category.dart' as _i700;
import '../../domain/repo_contract/new_releases_movies_repo.dart' as _i74;
import '../../domain/repo_contract/popular_movies_repo.dart' as _i637;
import '../../domain/repo_contract/recommended_movies_repo.dart' as _i587;
import '../../domain/repo_contract/search_repo.dart' as _i404;
import '../../domain/repo_contract/watch_list_movies_repo.dart' as _i475;
import '../../domain/usecases/categories_movies_use_case.dart' as _i926;
import '../../domain/usecases/get_more_like_this_movies_use_case.dart' as _i470;
import '../../domain/usecases/get_new_releases_movie_use_case.dart' as _i236;
import '../../domain/usecases/get_popular_movies_use_case.dart' as _i653;
import '../../domain/usecases/get_recommended_movies_use_case.dart' as _i877;
import '../../domain/usecases/moveis_based_on_category_use_case.dart' as _i789;
import '../../domain/usecases/search_use_case.dart' as _i130;
import '../../domain/usecases/watch_list_movies_use_case.dart' as _i940;
import '../../presentation/screens/category_details/viewModel/cubit/category_details_cubit.dart'
    as _i162;
import '../../presentation/screens/movie_details/viewModel/cubit/more_like_this_movies_cubit.dart'
    as _i426;
import '../../presentation/tabs/browse/viewModel/cubit/browse_cubit.dart'
    as _i149;
import '../../presentation/tabs/home/viewModel/cubits/new_releases_movie_cubit.dart'
    as _i516;
import '../../presentation/tabs/home/viewModel/cubits/popular_movies_cubit.dart'
    as _i1016;
import '../../presentation/tabs/home/viewModel/cubits/recommended_movie_cubit.dart'
    as _i165;
import '../../presentation/tabs/search/viewModel/cubit/search_cubit.dart'
    as _i792;
import '../../presentation/tabs/watch_list/viewModel/cubits/watch_list_cubit.dart'
    as _i22;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i442.ApiManager>(() => _i442.ApiManager());
    gh.singleton<_i867.FirebaseService>(() => _i867.FirebaseService());
    gh.factory<_i349.PopularMoviesDataSource>(() =>
        _i1053.PopularMoviesApiDataSourceImpl(
            apiManager: gh<_i442.ApiManager>()));
    gh.factory<_i637.PopularMoviesRepo>(() => _i877.PopularMoviesRepoImpl(
        dataSource: gh<_i349.PopularMoviesDataSource>()));
    gh.factory<_i7.MoreLikeThisMoviesDataSource>(() =>
        _i855.MoreLikeThisMoviesApiDataSourceImpl(
            apiManager: gh<_i442.ApiManager>()));
    gh.factory<_i125.CategoriesDataSource>(() =>
        _i533.CategoriesDataSourceImpl(apiManager: gh<_i442.ApiManager>()));
    gh.factory<_i270.MoviesBasedOnCategoryDataSource>(() =>
        _i539.MoviesBasedOnCategoryDataSourceImpl(
            apiManager: gh<_i442.ApiManager>()));
    gh.factory<_i591.NewReleasesMoviesDataSource>(() =>
        _i663.NewReleasesMoviesDataSourceImpl(
            apiManager: gh<_i442.ApiManager>()));
    gh.factory<_i269.RecommendedMoviesDataSource>(() =>
        _i459.RecommendedMoviesApiDataSourceImpl(
            apiManager: gh<_i442.ApiManager>()));
    gh.factory<_i653.GetPopularMoviesUseCase>(() =>
        _i653.GetPopularMoviesUseCase(repo: gh<_i637.PopularMoviesRepo>()));
    gh.factory<_i170.WatchListMoviesDataSource>(() =>
        _i581.WatchListMoviesDataSourceImpl(
            firebaseService: gh<_i867.FirebaseService>()));
    gh.factory<_i757.SearchDataSource>(
        () => _i949.SearchDataSourceImpl(apiManager: gh<_i442.ApiManager>()));
    gh.factory<_i728.CategoriesRepo>(() => _i807.CategoriesMoviesRepoImpl(
        dataSource: gh<_i125.CategoriesDataSource>()));
    gh.factory<_i700.MoviesBasedOnCategoryRepo>(() =>
        _i346.MoviesBasedOnCategoryRepoImpl(
            dataSource: gh<_i270.MoviesBasedOnCategoryDataSource>()));
    gh.factory<_i1016.PopularMoviesCubit>(() => _i1016.PopularMoviesCubit(
        getPopularMoviesUseCase: gh<_i653.GetPopularMoviesUseCase>()));
    gh.factory<_i74.NewReleaseMovieRepo>(() => _i659.NewReleaseMovieRepoImpl(
        newReleasesMoviesDataSource: gh<_i591.NewReleasesMoviesDataSource>()));
    gh.factory<_i1013.MoreLikeThisMoviesRepo>(() =>
        _i314.MoreLikeThisMoviesRepoImpl(
            moreLikeThisMoviesDataSource:
                gh<_i7.MoreLikeThisMoviesDataSource>()));
    gh.factory<_i587.RecommendedMoviesRepo>(() =>
        _i235.RecommendedMoviesRepoImpl(
            recommendedMoviesDataSource:
                gh<_i269.RecommendedMoviesDataSource>()));
    gh.factory<_i475.WatchListMoviesRepo>(() => _i997.WatchListMoviesRepoImpl(
        watchListMoviesDataSource: gh<_i170.WatchListMoviesDataSource>()));
    gh.factory<_i404.SearchRepo>(
        () => _i1008.SearchRepoImpl(dataSource: gh<_i757.SearchDataSource>()));
    gh.factory<_i877.GetRecommendedMoviesUseCase>(() =>
        _i877.GetRecommendedMoviesUseCase(
            repo: gh<_i587.RecommendedMoviesRepo>()));
    gh.factory<_i470.GetMoreLikeThisMoviesUseCase>(() =>
        _i470.GetMoreLikeThisMoviesUseCase(
            repo: gh<_i1013.MoreLikeThisMoviesRepo>()));
    gh.factory<_i165.RecommendedMovieCubit>(() => _i165.RecommendedMovieCubit(
        useCase: gh<_i877.GetRecommendedMoviesUseCase>()));
    gh.factory<_i789.MoviesBasedOnCategoryUseCase>(() =>
        _i789.MoviesBasedOnCategoryUseCase(
            repo: gh<_i700.MoviesBasedOnCategoryRepo>()));
    gh.factory<_i926.CategoriesUseCase>(
        () => _i926.CategoriesUseCase(repo: gh<_i728.CategoriesRepo>()));
    gh.factory<_i236.GetNewReleasesMovieUseCase>(() =>
        _i236.GetNewReleasesMovieUseCase(repo: gh<_i74.NewReleaseMovieRepo>()));
    gh.factory<_i940.WatchListMoviesUseCase>(() => _i940.WatchListMoviesUseCase(
        watchListMoviesRepo: gh<_i475.WatchListMoviesRepo>()));
    gh.factory<_i149.BrowseCubit>(
        () => _i149.BrowseCubit(useCase: gh<_i926.CategoriesUseCase>()));
    gh.factory<_i130.SearchUseCase>(
        () => _i130.SearchUseCase(repo: gh<_i404.SearchRepo>()));
    gh.factory<_i426.MoreLikeThisMoviesCubit>(() =>
        _i426.MoreLikeThisMoviesCubit(
            getMoreLikeThisMoviesUseCase:
                gh<_i470.GetMoreLikeThisMoviesUseCase>()));
    gh.factory<_i22.WatchListCubit>(() => _i22.WatchListCubit(
        watchListMoviesUseCase: gh<_i940.WatchListMoviesUseCase>()));
    gh.factory<_i516.NewReleasesMoviesCubit>(() => _i516.NewReleasesMoviesCubit(
        getNewReleasesMovieUseCase: gh<_i236.GetNewReleasesMovieUseCase>()));
    gh.factory<_i162.CategoryDetailsCubit>(() => _i162.CategoryDetailsCubit(
        useCase: gh<_i789.MoviesBasedOnCategoryUseCase>()));
    gh.factory<_i792.SearchCubit>(
        () => _i792.SearchCubit(useCase: gh<_i130.SearchUseCase>()));
    return this;
  }
}

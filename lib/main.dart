import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/presentation/tabs/watch_list/viewModel/cubits/watch_list_cubit.dart';

import 'data/api/firebase_service.dart';
import 'data/data_source_impl/watch_list_movies_data_source_impl.dart';
import 'data/repo_impl/watch_list_repo_impl.dart';
import 'domain/usecases/watch_list_movies_use_case.dart';
import 'firebase_options.dart';
import 'my_app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  runApp(BlocProvider(
      create: (context) => getIt<WatchListCubit>()..getWatchList(),
      child: const MyApp()));
}

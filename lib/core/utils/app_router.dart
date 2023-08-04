
import 'package:bookly/Features/home/data/model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly/Features/home/presenation/viewmodel/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/search/presentation/views/searrch_view.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/home/presenation/views/book_details_view.dart';
import '../../Features/home/presenation/views/home_view.dart';
import '../../Features/splash/presentation/views/splash_view.dart';

abstract class AppRouter{
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
      routes: [
        GoRoute(
          path:'/',
          builder: (context, state) => const SplashView(),
        ),
        GoRoute(
          path: kSearchView,
          builder: (context, state) => const SearchView(),
        ),
        GoRoute(
          path: kHomeView,
          builder: (context, state) => const HomeView(),
        ),
        GoRoute(
          path: kBookDetailsView,
          builder: (context, state) => BlocProvider(
              create: (BuildContext context) => SimilarBooksCubit(
                getIt.get<HomeRepoImpl>(),
              ),
          child:  BookDetailsView(bookModel: state.extra as BookModel,)),
        )
      ]
  );
}
import 'package:assesment_test/src/features/Movies/binding/movies_detail_binding.dart';
import 'package:assesment_test/src/features/Movies/screens/movie_detail_screen.dart';
import 'package:assesment_test/src/features/Movies/screens/watch_trailer_screen.dart';
import 'package:assesment_test/src/features/home/binding/home_tab_binding.dart';
import 'package:assesment_test/src/features/home/screens/home_tab_screen.dart';
import 'package:assesment_test/utils/router/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = Routes.homeScreen; //change tis to splash

  static final routes = [
    GetPage(
      name: Routes.homeScreen,
      page: () => const HomeTabsScreen(),
      binding: HomeTabBinding(),
    ),
    GetPage(
      name: Routes.movieDetailScreen,
      page: () => const MovieDetailScreen(),
      binding: MoviesDetailScreenBinding(),
    ),
    GetPage(
      name: Routes.watchTrailerScreen,
      page: () => const WatchTrailerScreen(),
    ),
  ];
}

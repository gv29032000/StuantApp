import 'package:get/get.dart';
import 'package:toppr1/screens/chapters/widgets/video.dart';

import '../screens/chapt_list/view/chapt_list.view.dart';
import '../screens/chapters/view/chapt_detail_page.view.dart';
import '../screens/chapters/view/chapt_page.view.dart';
import '../screens/chapters/view/chapt_video.view.dart';
import '../screens/chapters/widgets/poly_concepts.view.dart';
import '../screens/home/view/home_view.dart';
import '../screens/home/widgets/history_page.dart';
import '../screens/login/view/login_view.dart';
import '../screens/quick_practice/crash_course/view/crash_course.dart';
import '../screens/quick_practice/ncert_solution/view/ncert_solution.dart';
import '../screens/splash/view/splash_view.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;
  static final routes = [
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: '/history_page', page: () => HistoryPage()),
    GetPage(name: '/splash', page: () => SplashPage()),
    GetPage(name: '/login', page: () => LoginPage()),
    GetPage(name: '/poly_videos', page: () => PolynomialVideoPage()),
    GetPage(name: '/poly_page', page: () => PolynomialPage()),
    GetPage(name: '/poly_concepts', page: () => PolyConceptsPage()),
    GetPage(name: '/poly_viewAll', page: () => PolynomialViewAllPage()),
    GetPage(name: '/video', page: () => MyVideo()),
    GetPage(name: '/maths_chapt_page', page: () => MathsChapterPage()),
    GetPage(name: '/ncert_soln', page: () => NCERTSolutionPage()),
    GetPage(name: '/crash_course', page: () => PolyCrashCoursePage()),
  ];
}

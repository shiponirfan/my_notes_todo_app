import 'package:get/get.dart';
import 'package:my_notes_todo_app/routes/routes_name.dart';
import 'package:my_notes_todo_app/views/home_screen.dart';
import 'package:my_notes_todo_app/views/notes_screen.dart';
import 'package:my_notes_todo_app/views/splash_screen.dart';

class RoutesPages {
  static List<GetPage<dynamic>>? routes = [
    GetPage(
      name: RoutesName.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: RoutesName.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RoutesName.noteScreen,
      page: () => const NotesScreen(),
    ),
  ];
}

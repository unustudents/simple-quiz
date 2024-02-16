import 'package:get/get.dart';

import '../modules/allquiz/bindings/allquiz_binding.dart';
import '../modules/allquiz/views/allquiz_view.dart';
import '../modules/forgotpasswd/bindings/forgotpasswd_binding.dart';
import '../modules/forgotpasswd/views/forgotpasswd_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/materi/bindings/materi_binding.dart';
import '../modules/materi/views/materi_view.dart';
import '../modules/organisation/bindings/organisation_binding.dart';
import '../modules/organisation/views/organisation_view.dart';
import '../modules/praquiz/bindings/praquiz_binding.dart';
import '../modules/praquiz/views/praquiz_view.dart';
import '../modules/profil/bindings/profil_binding.dart';
import '../modules/profil/views/profil_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL,
      page: () => const ProfilView(),
      binding: ProfilBinding(),
    ),
    GetPage(
      name: _Paths.FORGOTPASSWD,
      page: () => const ForgotpasswdView(),
      binding: ForgotpasswdBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.PRAQUIZ,
      page: () => const PraquizView(),
      binding: PraquizBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.ORGANISATION,
      page: () => const OrganisationView(),
      binding: OrganisationBinding(),
    ),
    GetPage(
      name: _Paths.ALLQUIZ,
      page: () => const AllquizView(),
      binding: AllquizBinding(),
    ),
    GetPage(
      name: _Paths.MATERI,
      page: () => const MateriView(),
      binding: MateriBinding(),
    ),
  ];
}

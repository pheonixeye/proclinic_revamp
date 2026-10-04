import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proclinic_revamp/pages/error_page/error_page.dart';
import 'package:proclinic_revamp/pages/loading_page/loading_page.dart';
import 'package:proclinic_revamp/pages/login_page/login_page.dart';
import 'package:proclinic_revamp/providers/px_locale.dart';
import 'package:proclinic_revamp/utils/shared_prefs.dart';
// import 'package:proclinic_revamp/utils/shared_prefs.dart';
import 'package:proclinic_revamp/utils/utils_keys.dart';
import 'package:provider/provider.dart';

/// GoRouter configuration
///
class AppRouter {
  AppRouter();
  //Top Level Routes
  static const String loading = "/";
  static const String loginPage = "/loginPage";

  String? get currentRouteName =>
      router.routerDelegate.currentConfiguration.last.route.name;

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    overridePlatformDefaultLocation: true,
    navigatorKey: UtilsKeys.navigatorKey,
    initialLocation: loading,
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: ErrorPage(key: state.pageKey),
      );
    },
    routes: [
      GoRoute(
        path: loginPage,
        name: loginPage,
        builder: (context, state) {
          return LoginPage(key: state.pageKey);
        },
      ),
      GoRoute(
        path: loading,
        name: loading,
        builder: (context, state) {
          return LoadingPage(key: state.pageKey);
        },
        //to induce error page
        redirect: (context, state) async {
          final pxLocale = context.read<PxLocale>();
          if (state.fullPath == loading) {
            final storedLanguage = await asyncPrefs.getString('lang');
            if (storedLanguage != null) {
              await pxLocale.setLang(storedLanguage);
              pxLocale.setLocale();
            } else {
              await pxLocale.setLang('en');
              pxLocale.setLocale();
            }
          }
          return null;
        },
        routes: [],
      ),
    ],
  );
}

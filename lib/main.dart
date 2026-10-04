import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:proclinic_revamp/localization/app_localizations.dart';
import 'package:proclinic_revamp/providers/_main.dart';
import 'package:proclinic_revamp/providers/px_locale.dart';
import 'package:proclinic_revamp/router/app_router.dart';
import 'package:proclinic_revamp/utils/shared_prefs.dart';
import 'package:proclinic_revamp/utils/utils_keys.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('ar');
  await initializeDateFormatting('en');

  initAsyncPrefs();

  runApp(const AppProvider());
}

class AppProvider extends StatelessWidget {
  const AppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: providers, child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PxLocale>(
      builder: (context, l, _) {
        return MaterialApp.router(
          scaffoldMessengerKey: UtilsKeys.scaffoldMessengerKey,
          title: const String.fromEnvironment('APPLICATION_NAME'),
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          locale: l.locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          // theme: AppTheme(context).theme,
          builder: (context, child) {
            return Overlay(
              initialEntries: [OverlayEntry(builder: (context) => child!)],
            );
          },
        );
      },
    );
  }
}

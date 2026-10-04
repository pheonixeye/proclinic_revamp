import 'package:proclinic_revamp/providers/px_locale.dart';
import 'package:proclinic_revamp/router/app_router.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider.value(
    value: AppRouter.router.routeInformationProvider,
  ),
  ChangeNotifierProvider(create: (context) => PxLocale()),
];

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:proclinic_revamp/constants/app_assets.dart';
import 'package:proclinic_revamp/extensions/loc_ext.dart';
import 'package:proclinic_revamp/router/app_router.dart';
import 'package:provider/provider.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(AppAssets.bg),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.white.withValues(alpha: 0.5),
                  BlendMode.modulate,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Container(
                  height: MediaQuery.sizeOf(context).height / 2,
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: SvgPicture.asset(AppAssets.err, fit: BoxFit.contain),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    context.loc.somethingWentWrong,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      // color: AppTheme.appBarColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  context.loc.errorText,
                  textAlign: TextAlign.center,
                  // style: TextStyle(fontSize: 16, color: AppTheme.mainFontColor),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Consumer<GoRouteInformationProvider>(
                        builder: (context, r, _) {
                          return TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  // color: AppTheme.appBarColor,
                                  width: 0.3,
                                ),
                              ),
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {
                              GoRouter.of(context).goNamed(AppRouter.loading);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 24,
                              ),
                              child: Text(
                                context.loc.homepage,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  // color: AppTheme.mainFontColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

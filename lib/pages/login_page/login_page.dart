import 'package:flutter/material.dart';
import 'package:proclinic_revamp/providers/px_locale.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: () async {
          final pxLocale = context.read<PxLocale>();
          await pxLocale.switchLocale();
        },
      ),
    );
  }
}

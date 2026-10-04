import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proclinic_revamp/constants/app_assets.dart';
import 'package:proclinic_revamp/extensions/after_layout.dart';
import 'package:proclinic_revamp/router/app_router.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with SingleTickerProviderStateMixin, AfterLayoutMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 0.95).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Image.asset(AppAssets.icon),
        ),
      ),
    );
  }

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted) {
        GoRouter.of(context).goNamed(AppRouter.loginPage);
      }
    });
  }
}

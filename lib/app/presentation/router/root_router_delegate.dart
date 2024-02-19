import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kigo_app/app/aplication/auth/auth_cubit.dart';
import 'package:kigo_app/app/presentation/router/root_pages.dart';
import 'package:kigo_app/app/presentation/router/router_delegate_base.dart';

class RootRouterDelegate extends RouterDelegateBase {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Navigator(
          key: _navigatorKey,
          pages: const [
            LoginPage(),
          ],
          onPopPage: (route, result) => route.didPop(result),
        );
      },
    );
  }

  @override
  Future<bool> popRoute() async {
    final keyContext = _navigatorKey.currentContext;

    if (keyContext != null && Navigator.of(keyContext).canPop() == true) {
      Navigator.of(keyContext).pop();
      return true;
    }

    return false;
  }
}

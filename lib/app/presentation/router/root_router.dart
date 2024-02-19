import 'package:flutter/material.dart';
import 'package:kigo_app/app/presentation/router/root_router_delegate.dart';

class RootRouter extends StatelessWidget {
  const RootRouter({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Implement the RootRouter cubit
    return Router(
      routerDelegate: RootRouterDelegate(),
      backButtonDispatcher: RootBackButtonDispatcher(),
    );
  }
}

import 'package:flutter/material.dart';

abstract class RouterDelegateBase extends RouterDelegate<Object?> {
  @override
  void addListener(VoidCallback listener) {}

  @override
  Widget build(BuildContext context);

  @override
  Future<bool> popRoute();

  @override
  void removeListener(VoidCallback listener) {}

  @override
  Future<void> setNewRoutePath(void configuration) async {}
}

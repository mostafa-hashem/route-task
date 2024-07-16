import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:route_task/core/di/injection_container.dart';
import 'package:route_task/core/utils/observer.dart';
import 'package:route_task/route_task.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();

  runApp(const RouteTask());
}

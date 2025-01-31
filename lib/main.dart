import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_view_trading/app.dart';
import 'package:app_view_trading/cubit_observer.dart';
import 'package:app_view_trading/view/home/service/get-it/get_it_source.dart';

void main() {
  GetItSource.setup();
  Bloc.observer = CubitObserver();
  runApp(const MyApp());
}

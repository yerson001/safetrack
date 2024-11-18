import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safetrack/src/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:safetrack/src/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:safetrack/src/presentation/pages/auth/register/block/register_bloc.dart';
import 'package:safetrack/src/presentation/pages/auth/register/block/register_event.dart';

List<BlocProvider> blocproviders = [
  BlocProvider<LoginBloc>(
      create: (context) => LoginBloc()..add(LoginInitEvent())),
  BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc()..add(RegisterInitEvent())),
];

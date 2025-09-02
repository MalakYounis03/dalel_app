import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel_app/features/auth/presentation/views/forget_password_view.dart';
import 'package:dalel_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:dalel_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:dalel_app/features/home/data/models/historical_characters_model.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model.dart';
import 'package:dalel_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel_app/features/home/presentation/views/historical_character_details_view.dart';
import 'package:dalel_app/features/home/presentation/views/historical_periods_details_view.dart';

import 'package:dalel_app/features/home/presentation/views/home_view.dart';
import 'package:dalel_app/features/home/presentation/widgets/home_nav_bar_widget.dart';
import 'package:dalel_app/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:dalel_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => SplashView()),
    GoRoute(path: "/onBoarding", builder: (context, state) => OnBoardingView()),
    GoRoute(
      path: "/signUp",
      builder: (context, state) =>
          BlocProvider(create: (context) => AuthCubit(), child: SignUpView()),
    ),
    GoRoute(
      path: "/signIn",
      builder: (context, state) =>
          BlocProvider(create: (context) => AuthCubit(), child: SignInView()),
    ),
    GoRoute(path: "/home", builder: (context, state) => HomeView()),
    GoRoute(
      path: "/forgetPassword",
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: ForgotPasswordView(),
      ),
    ),
    GoRoute(
      path: "/homeNavBar",
      builder: (context, state) => HomeNavBarWidget(),
    ),
    GoRoute(
      path: "/historicalPeriodsDetailsView",
      builder: (context, state) => BlocProvider(
        create: (context) => HomeCubit()..getHistoricalCharacters(),
        child: HistoricalPeriodsDetailsView(
          model: state.extra as HistoricalPeriodsModel,
        ),
      ),
    ),
    GoRoute(
      path: "/historicalCharactersDetailsView",
      builder: (context, state) => HistoricalCharacterDetailsView(
        model: state.extra as HistoricalCharactersModel,
      ),
    ),
  ],
);

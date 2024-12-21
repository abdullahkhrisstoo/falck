import 'package:falack_app/features/authentication/presentation/screen/login_screen.dart';
import 'package:falack_app/features/interests/presentation/screen/intrest_screen.dart';
import 'package:falack_app/features/interests/presentation/screen/selected_intreset_label.dart';
import 'package:falack_app/features/test/test_screen.dart';
import 'package:falack_app/shared/button/bottom_nav_bar_widget.dart';
import 'package:falack_app/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:falack_app/bloc_observer.dart';
import 'package:falack_app/core/cache/cache_helper.dart';
import 'package:falack_app/core/l10n/l10n.dart';
import 'package:falack_app/core/theme/theme.dart';
import 'package:falack_app/core/utils/constant/app_constant.dart';
// import 'package:falack_app/core/theme/dark_theme.dart';

import 'injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = AppBlocObserver();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final brightness = View.of(context).platformDispatcher.platformBrightness;
    MaterialTheme theme = const MaterialTheme();

    return
        // MultiBlocProvider(
        //   providers: const [
        //     //  BlocProvider(create: (context) => di.sl<>()),
        //   ],
        //   child:
        MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstant.APP_NAME,
      locale: const Locale('en'),
      supportedLocales: LanguageMangement.locales,
      localizationsDelegates: LanguageMangement.localizationsDelegates,
      theme: theme.dark(),
      home: LoginScreen(),
      // home: TestScreen2(),
      // home: const TestScreen2(),
      // home: const AuthOtpScreen(isPhone: true, contactInfo: '123-456-7890')
      // home: const AuthOtpScreen(isPhone: false, contactInfo: 'example@mail.com')
      // )
    );

  }
}







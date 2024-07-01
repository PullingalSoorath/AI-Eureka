import 'package:eureka/application/signIn_signUp/sign_in_sign_up_bloc.dart';
import 'package:eureka/presentation/screen/authentication.dart';
import 'package:eureka/presentation/screen/dashboard_screen.dart';
import 'package:eureka/temp.dart';
import 'package:eureka/temp2.dart';
import 'package:eureka/temp3.dart';
import 'package:eureka/temp4.dart';
import 'package:eureka/util/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SignInSignUpBloc();
      },

      // MultiBlocProvider(
      // providers: [
      //   BlocProvider<SignInSignUpBloc>(
      //     create: (context) => SignInSignUpBloc(),
      //   )
      // ],
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: lightMode,
        darkTheme: darkMode,
        debugShowCheckedModeBanner: false,
        home: const Authentication(),
        // home: const DashboardScreen(),
        // home: const AnimatedBg(),
        // home: BlurredCircles(),
        // home: MovingCirclesScreen(),
        // home: MovingCirclesScreen2(),
      ),
    );
  }
}

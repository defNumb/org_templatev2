import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:org_templatev2/blocs/blocs/bloc/authentication_bloc.dart';
import 'package:org_templatev2/firebase_options.dart';
import 'package:org_templatev2/services/auth_service.dart';
import 'package:org_templatev2/utils/const.dart';
import 'package:org_templatev2/views/landing_page.dart';
import 'package:path_provider/path_provider.dart';

import 'blocs/cubits/app_theme/theme_mode_cubit.dart';
import 'blocs/cubits/page_provider/page_provider_cubit.dart';
import 'blocs/cubits/signin/signin_cubit.dart';

void main() async {
  // Dependency Injection
  // Setting up Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
  );

  // Setting up HydratedBloc
  // This will help store information in the device
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb ? HydratedStorage.webStorageDirectory : await getApplicationDocumentsDirectory(),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthService>(
          create: (context) => AuthService(
            firebaseFirestore: FirebaseFirestore.instance,
            firebaseAuth: FirebaseAuth.instance,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeModeCubit>(
            create: (context) => ThemeModeCubit(),
          ),
          // auth
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(
              authService: context.read<AuthService>(),
            ),
          ),
          // sign in cubit
          BlocProvider<SigninCubit>(
            create: (context) => SigninCubit(
              authService: context.read<AuthService>(),
            ),
          ),
          //page provider
          BlocProvider<PageProviderCubit>(
            create: (BuildContext context) => PageProviderCubit(),
          ),
        ],
        child: BlocBuilder<ThemeModeCubit, ThemeModeState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: state.themeModeState,
              home: const LandingPage(),
            );
          },
        ),
      ),
    );
  }
}

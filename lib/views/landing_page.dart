import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:org_templatev2/blocs/blocs/bloc/authentication_state.dart';
import 'package:org_templatev2/views/authentication/sign_in.dart';
import 'package:org_templatev2/views/page_container.dart';

import '../blocs/blocs/bloc/authentication_bloc.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.authStatus == AuthStatus.authenticated) {
          // if the user is authenticated, navigate to the page container

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PageContainer(),
            ),
          );
        } else if (state.authStatus == AuthStatus.unauthenticated) {
          // if the user is not authenticated, navigate to the sign in page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignIn(),
            ),
          );
        } else if (state.authStatus == AuthStatus.unknown) {
          // if the user is not authenticated, navigate to the sign in page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignIn(),
            ),
          );
        }
      },
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

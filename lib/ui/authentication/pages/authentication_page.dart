import 'package:cme_flutter_assessment/bloc/authentication/authentication_bloc.dart';
import 'package:cme_flutter_assessment/bloc/authentication/authentication_bloc.dart';
import 'package:cme_flutter_assessment/resources/paths.dart';
import 'package:cme_flutter_assessment/ui/authentication/widgets/block/authentication_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/google_authentication_button.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Flexible(
              flex: 3,
              child: AuthenticationLogo(),
            ),
            Flexible(
              flex: 2,
              child: BlocProvider(
                create: (c) => AuthenticationBloc(),
                child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (blocContext, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (state is AuthenticationLoadingState)
                          const CircularProgressIndicator.adaptive()
                        else
                          GoogleAuthenticationButton(
                            onTap: () {
                              blocContext
                                  .read<AuthenticationBloc>()
                                  .add(GoogleAuthenticateEvent(context));
                            },
                          ),
                        22.verticalSpace,
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

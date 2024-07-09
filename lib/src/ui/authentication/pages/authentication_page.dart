import 'package:cme_flutter_assessment/src/bloc/authentication/authentication_bloc.dart';
import 'package:cme_flutter_assessment/src/data/repository/authentication_repository.dart';
import 'package:cme_flutter_assessment/src/data/repository/secure_storage_repository.dart';
import 'package:cme_flutter_assessment/src/ui/authentication/widgets/block/authentication_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                create: (c) {
                  return AuthenticationBloc(
                      authenticationRepository: AuthenticationRepository(),
                      secureStorageRepository: SecureStorageRepository())
                    ..add(CheckSessionAuthenticationEvent(context));
                },
                child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (blocContext, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (state is AuthenticationLoadingState)
                          const CircularProgressIndicator.adaptive()
                        else
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GoogleAuthenticationButton(
                                onTap: () {
                                  blocContext
                                      .read<AuthenticationBloc>()
                                      .add(GoogleAuthenticateEvent(context));
                                },
                              ),
                              if (state is AuthenticationErrorState)
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Text(state.reason,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                )
                            ],
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

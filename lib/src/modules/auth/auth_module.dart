part of injector_setup;

void authModule() {
  injector.registerSingleton<AuthApiService>(
    RestApiFactory(injector(), injector()).provideAuthService(),
  );
  injector.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(injector(), injector()),
  );
  injector.registerSingleton<AuthUseCase>(
    AuthUseCase(injector()),
  );
  // injector.registerSingleton<AuthenticationBloc>(
  //   AuthenticationBloc(injector()),
  // );
  // injector.registerSingleton<LoginBloc>(LoginBloc(injector()));
}

part of injector_setup;

void authModule() {
  /**
   * Api Services
   */
  injector.registerSingleton<AuthService>(
    RestApiFactory(injector(), injector()).provideAuthService(),
  );

  /**
   * Repositories
   */
  injector.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(injector(), injector()),
  );

  /**
   * Use Cases
   */
  injector.registerSingleton<AuthUseCase>(
    AuthUseCase(injector()),
  );
}

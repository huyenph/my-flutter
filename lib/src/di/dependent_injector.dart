part of injector_setup;

void setupDependent() {
  injector.registerSingleton<HttpHandler>(HttpHandler(injector()));
  injector.registerSingleton<RestApiFactoryListener>(HttpHandler(injector()));
  injector.registerSingleton<RestApiFactory>(
    RestApiFactory(injector(), injector()),
  );
}

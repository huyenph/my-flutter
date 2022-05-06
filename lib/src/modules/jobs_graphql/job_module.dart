part of injector_setup;

void jobModule() {
  injector.registerSingleton<JobRepository>(
    JobRepositoryImpl(JobApiService.create()),
  );
  injector.registerSingleton<JobUseCase>(
    JobUseCase(injector()),
  );
}

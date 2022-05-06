import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_flutter/src/modules/jobs_graphql/domain/models/job.dart';
import 'package:my_flutter/src/modules/jobs_graphql/domain/usecases/job_usecase.dart';

part 'jobs_event.dart';

part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  final JobUseCase _jobUseCase;

  JobsBloc({required JobUseCase jobUseCase})
      : _jobUseCase = jobUseCase,
        super(JobsLoadInProgress()) {
    on<JobsFetchStarted>(_onJobsFetchStarted);
  }

  void _onJobsFetchStarted(
    JobsFetchStarted event,
    Emitter<JobsState> emitter,
  ) async {
    emitter(JobsLoadInProgress());
    try {
      final jobs = await _jobUseCase.fetchJobs();
      emitter(JobsLoadSuccess(jobs));
    } catch (_) {
      emitter(JobsLoadFailure());
    }
  }
}

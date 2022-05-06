import 'package:my_flutter/src/modules/jobs_graphql/data/job_api_service.dart';
import 'package:my_flutter/src/modules/jobs_graphql/domain/models/job.dart';
import 'package:my_flutter/src/modules/jobs_graphql/domain/repositories/job_repository.dart';

class JobRepositoryImpl extends JobRepository {
  final JobApiService _jobApiService;

  JobRepositoryImpl(this._jobApiService);

  @override
  Future<List<Job>> fetchJobs() => _jobApiService.fetchJobs();
}

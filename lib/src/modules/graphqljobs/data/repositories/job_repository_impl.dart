import 'package:my_flutter/src/modules/graphqljobs/data/job_api_service.dart';
import 'package:my_flutter/src/modules/graphqljobs/domain/models/job.dart';
import 'package:my_flutter/src/modules/graphqljobs/domain/repositories/job_repository.dart';

class JobRepositoryImpl extends JobRepository {
  final JobApiService _jobApiService;

  JobRepositoryImpl(this._jobApiService);

  @override
  Future<List<Job>> fetchJobs() => _jobApiService.fetchJobs();
}

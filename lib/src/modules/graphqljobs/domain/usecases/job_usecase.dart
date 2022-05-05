import 'package:my_flutter/src/modules/graphqljobs/domain/models/job.dart';
import 'package:my_flutter/src/modules/graphqljobs/domain/repositories/job_repository.dart';

class JobUseCase {
  final JobRepository _jobRepository;

  JobUseCase(this._jobRepository);

  Future<List<Job>> fetchJobs() => _jobRepository.fetchJobs();
}

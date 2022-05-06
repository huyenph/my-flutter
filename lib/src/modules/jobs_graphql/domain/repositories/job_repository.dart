import 'package:my_flutter/src/modules/jobs_graphql/domain/models/job.dart';

abstract class JobRepository {
  Future<List<Job>> fetchJobs();
}

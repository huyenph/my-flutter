import 'package:my_flutter/src/modules/graphqljobs/domain/models/job.dart';

abstract class JobRepository {
  Future<List<Job>> fetchJobs();
}

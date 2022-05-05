import 'package:graphql/client.dart';
import 'package:my_flutter/src/modules/graphqljobs/data/queries.dart'
    as queries;
import 'package:my_flutter/src/modules/graphqljobs/domain/models/job.dart';

class GetJobRequestValue implements Exception {}

class JobApiService {
  final GraphQLClient _graphQLClient;

  const JobApiService(this._graphQLClient);

  factory JobApiService.create() {
    final httpLink = HttpLink('https://api.graphql.jobs');
    final link = Link.from([httpLink]);
    return JobApiService(GraphQLClient(cache: GraphQLCache(), link: link));
  }

  Future<List<Job>> fetchJobs() async {
    final result = await _graphQLClient.query(
      QueryOptions(document: gql(queries.fetchJobs)),
    );
    if (result.hasException) throw GetJobRequestValue();
    final data = result.data?['jobs'] as List;
    return data.map((e) => Job.fromJson(e)).toList();
  }
}

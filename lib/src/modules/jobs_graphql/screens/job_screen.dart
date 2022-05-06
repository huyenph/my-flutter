import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter/src/core/state/base_state.dart';
import 'package:my_flutter/src/di/injector_setup.dart';
import 'package:my_flutter/src/modules/jobs_graphql/blocs/jobs_bloc.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({Key? key}) : super(key: key);

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends BaseState<JobScreen> {
  @override
  Widget buildBody() {
    return BlocProvider(
      create: (_) => JobsBloc(jobUseCase: injector())..add(JobsFetchStarted()),
      child: BlocBuilder<JobsBloc, JobsState>(
        builder: (context, state) {
          if (state is JobsLoadInProgress) {
            return const CircularProgressIndicator();
          }
          if (state is JobsLoadSuccess) {
            return ListView.builder(
              itemCount: state.jobs.length,
              itemBuilder: (context, index) {
                final job = state.jobs[index];
                return ListTile(
                  key: Key(job.id),
                  leading: const Icon(Icons.location_city),
                  title: Text(job.title),
                  subtitle: job.locationNames != null
                      ? Text(job.locationNames!)
                      : null,
                  trailing: Icon(
                    job.isFeatured == true ? Icons.star : Icons.star_border,
                    color: Colors.orangeAccent,
                  ),
                );
              },
            );
          }
          return const Text('Oops something went wrong!');
        },
      ),
    );
  }

  @override
  String get appBarTitle => 'Jobs';
}

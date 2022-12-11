import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_manager/data/interfaces/ijobs_repository.dart';
import 'package:job_manager/data/models/job_model.dart';
import 'package:job_manager/data/repository/jobs_repository.dart';

final jobListNotifierProvider =
    StateNotifierProvider<JobsNotifier, JobsState>((ref) {
  return JobsNotifier(ref.read(jobsRepositoryProvider));
});

final jobsRepositoryProvider =
    Provider<IJobsRepository>((ref) => JobsRepository());

class JobsNotifier extends StateNotifier<JobsState> {
  final IJobsRepository _jobsRepository;
  JobsNotifier(this._jobsRepository) : super(const InitalJobsState());

  getJobs() async {
    try {
      state = const JobsLoadingState();
      final jobList = await _jobsRepository.getListOfJobs();
      print(jobList);
      state = JobsLoadedState(jobList);
    } catch (e) {
      state = JobsErrorState(e.toString());
    }
  }
}

abstract class JobsState {
  const JobsState();
}

class InitalJobsState extends JobsState {
  const InitalJobsState();
}

class JobsLoadingState extends JobsState {
  const JobsLoadingState();
}

class JobsLoadedState extends JobsState {
  final List<JobModel>? jobsList;
  const JobsLoadedState(this.jobsList);
}

class JobsErrorState extends JobsState {
  final String message;
  const JobsErrorState(this.message);
}

import 'package:job_manager/data/models/job_model.dart';

abstract class IJobsRepository {
  Future<List<JobModel>> getListOfJobs();
}

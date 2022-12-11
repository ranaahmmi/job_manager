import 'package:job_manager/data/interfaces/ijobs_repository.dart';
import 'package:job_manager/data/models/job_model.dart';
import 'package:job_manager/data/models/user_model.dart';
import 'package:job_manager/data/network/network_utils.dart';
import 'package:nb_utils/nb_utils.dart';

class JobsRepository extends IJobsRepository {
  @override
  Future<List<JobModel>> getListOfJobs() async {
    try {
      User user = User.fromJson(getJSONAsync('user'));
      final response = await NetworkUtil().getRequest(
        api: '/joblist/${user.appUserPk}',
      );

      final jobsList = List<JobModel>.from(
        response['items'].map((x) => JobModel.fromJson(x)),
      );

      return jobsList;
    } catch (e) {
      rethrow;
    }
  }
}

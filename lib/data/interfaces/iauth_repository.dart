import 'package:job_manager/data/models/user_model.dart';

abstract class IAuthRepository {
  Future<User> login(String email, String password, bool isRemember);
}
